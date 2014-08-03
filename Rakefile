# vim ft=ruby

require 'colored'
require 'yaml'

# ----- utility methods -----

def log(text)
  puts "--- #{text} ---".ljust(75,'-').yellow
end

def data
  @data ||= YAML.load_file('links.yaml')
end

def normalized_lang(input)
  return "en" if input == ''
  input.gsub('.','')
end

def gen_link_page(input_lang)
  fn   = "links#{input_lang}.page"
  lang = normalized_lang(input_lang)
  log "generating link page src/#{fn}"
  File.open("./src/#{fn}", 'w') do |f|
    hdr = <<-EOF
      ---
      headline: Mesa Verde / Cortez - Condo for Rent
      title: #{data['title'][lang]}
      inMenu: true
      orderInfo: 20
      subhead: #{data['subhead'][lang]}
      ---
    EOF
    f.puts hdr.gsub('      ','')
    f.puts ''
    f.puts "h2. #{data['title'][lang]}"
    f.puts ''
    f.puts data['intro'][lang]
    f.puts ''
    data['sections'].each do |sec|
      f.puts "h3. #{sec['name']}"
      f.puts ''
      sec['links'].each do |link|
        line = %[* "#{link['lbl']}":#{link['url']} - #{link['desc'][lang]}]
        f.puts line
      end
      f.puts ''
    end
  end
end

# ----- rake tasks -----

langs = ['', '.de', '.fr']

langs.each do |lang|
  file "src/links#{lang}.page" => 'links.yaml' do
    gen_link_page(lang)
  end
end

desc "Generate the link pages"
task :genlinks => langs.map {|lang| "src/links#{lang}.page" }

desc "Build the Site"
task :build => :genlinks do
  cmd = "webgen"
  log cmd
  system cmd
  system "echo mesa-verde-condo.com > output/CNAME"
  system "cp output/index.html output/cl.html"
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
