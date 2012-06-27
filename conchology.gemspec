# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','conchology','version.rb'])
spec = Gem::Specification.new do |s| 
  s.name = 'conchology'
  s.version = Conchology::VERSION
  s.author = 'Dennis Walters'
  s.email = 'dwalters@canvashosting.com'
  s.homepage = 'http://canvashosting.com'
  s.platform = Gem::Platform::RUBY
  s.summary = 'A gem that knows about calling out to the shell'
# Add your other files here if you make them
  s.files = %w(
README.md
lib
lib/conchology
lib/conchology/version.rb
lib/conchology.rb
  )
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.rdoc_options << '--title' << 'conchology' << '--main' << 'README.md' << '-ri'
  s.add_dependency('open4', '~> 1.3.0')
  s.add_development_dependency('rake', '~> 0.9.2.2')
  s.add_development_dependency('rdoc', '~> 3.12')
  s.add_development_dependency('rspec', '~> 2.10.0')
end
