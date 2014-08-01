# vim ft=ruby

def log(text)
  puts "--- #{text} ---".ljust(70,'-')
end

desc "Build the Site"
task :build do
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
