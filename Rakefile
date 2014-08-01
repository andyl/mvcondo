# vim ft=ruby

require 'colored'
require 'yaml'

def log(text)
  puts "--- #{text} ---".ljust(75,'-').yellow
end

def data
  @data ||= YAML.load_file('links.yaml')
end

def gen_link_page(lang)
  log "gen_link_page #{lang}"
  fn = lang == :en ? "links.page" : "links.#{lang}.page"
  lng_s = lang.to_s
  File.open("./src/#{fn}", 'w') do |f|
    hdr = <<-EOF
      ---
      headline: Mesa Verde / Cortez - Condo for Rent
      title: #{data['title'][lng_s]}
      inMenu: true
      orderInfo: 20
      subhead: #{data['subhead'][lng_s]}
      ---
    EOF
    f.puts hdr.gsub('      ','')
    f.puts ''
    f.puts "h2. #{data['title'][lng_s]}"
    f.puts ''
    f.puts data['intro'][lng_s]
    f.puts ''
    data['sections'].each do |sec|
      f.puts "h3. #{sec['name']}"
      f.puts ''
      sec['links'].each do |link|
        line = %[* "#{link['lbl']}":#{link['url']} - #{link['desc'][lng_s]}]
        f.puts line
      end
      f.puts ''
    end
  end
end

file 'src/links.page' => 'links.yaml' do
  gen_link_page(:en)
end

file 'src/links.de.page' => 'links.yaml' do
  gen_link_page(:de)
end

file 'src/links.fr.page' => 'links.yaml' do
  gen_link_page(:fr)
end

desc "Generate the link pages"
task :genlinks => %w(src/links.page src/links.de.page src/links.fr.page)

desc "Build the Site"
task :build => :genlinks do
  cmd = "webgen"
  log cmd
  system cmd
end

desc "Deploy the Site"
task :deploy do
  script = <<-EOF
    rm -rf /tmp/output
    cp -r output /tmp
    git add .
    git commit -am'update source files'
    git push
    git checkout gh-pages
    rm -rf *
    cp -r /tmp/output/* .
    git add .
    git commit -am'update website'
    git push
    git checkout master
  EOF
  script.each_line do |line|
    cleanline = line.chomp.strip
    log cleanline
    system cleanline
  end
end
