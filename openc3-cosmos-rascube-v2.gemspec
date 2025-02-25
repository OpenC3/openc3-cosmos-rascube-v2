# encoding: ascii-8bit

# Create the overall gemspec
Gem::Specification.new do |s|
  s.name = 'openc3-cosmos-rascube-v2'
  s.summary = 'OpenC3 Plugin for Rascube V2'
  s.description = <<-EOF
    OpenC3 Plugin for Rascube V2
  EOF
  s.license = 'MIT'
  s.authors = ['Ryan Melton']
  s.email = ['ryan@openc3.com']
  s.homepage = 'https://github.com/OpenC3/openc3-cosmos-rascube-v2'
  s.platform = Gem::Platform::RUBY

  if ENV['VERSION']
    s.version = ENV['VERSION'].dup
  else
    time = Time.now.strftime("%Y%m%d%H%M%S")
    s.version = '0.0.0' + ".#{time}"
  end
  s.files = Dir.glob("{targets,lib,tools,microservices}/**/*") + %w(Rakefile README.md LICENSE.txt plugin.txt requirements.txt)
end
