# encoding: ascii-8bit

# Create the overall gemspec
Gem::Specification.new do |s|
  s.name = 'openc3-cosmos-rascube-v2'
  s.summary = 'OpenC3 Plugin for Rascube V2'
  s.description = <<-EOF
    This plugin adds the COSMOS target definition for the Robinson Aerospace Rascube V2.
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
  s.files = Dir.glob("{targets,lib,tools,microservices,public}/**/*") + %w(Rakefile README.md LICENSE.txt plugin.txt requirements.txt)
  s.metadata = {
    "source_code_uri" => "https://github.com/OpenC3/openc3-cosmos-rascube-v2",
    "openc3_store_title" => "Robinson Aerospace Rascube V2",
    "openc3_store_keywords" => "robinson, rascube, cubesat, target",
    "openc3_store_image" => "public/store_img.avif",
    "openc3_store_access_type" => "public",
    "openc3_cosmos_minimum_version" => "6.0.0"
  }
end
