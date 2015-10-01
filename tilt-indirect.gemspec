spec = Gem::Specification.new do |s|
  s.name = 'tilt-indirect'
  s.version = '1.0.0'
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true
  s.extra_rdoc_files = ["README.rdoc", "CHANGELOG", "MIT-LICENSE"]
  s.rdoc_options += ["--quiet", "--line-numbers", "--inline-source", '--title', 'tilt-indirect: Adds indirection for tilt templates', '--main', 'README.rdoc']
  s.license = "MIT"
  s.summary = "Adds indirection for tilt templates"
  s.author = "Jeremy Evans"
  s.email = "code@jeremyevans.net"
  s.homepage = "https://github.com/jeremyevans/tilt-indirect"
  s.files = %w(MIT-LICENSE CHANGELOG README.rdoc Rakefile) + Dir["{spec,lib}/**/*"] 
  s.description = <<END
tilt-indirect adds indirection for tilt templates.  For example, you
can have a foo.indirect template that when render renders a separate
template (e.g. /path/to/bar.erb).
END
  s.add_dependency('tilt')
  s.add_development_dependency('minitest')
end
