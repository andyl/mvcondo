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
  EOF
  script.each_line do |line|
    log line
    system line
  end
end
