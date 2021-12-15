require "rake"
require "rake/clean"

CLEAN.include ["tilt-indirect-*.gem", "rdoc", "coverage"]

desc "Build tilt-indirect gem"
task :package=>[:clean] do |p|
  sh %{#{FileUtils::RUBY} -S gem build tilt-indirect.gemspec}
end

### Specs

desc "Run tests"
task :test do
  sh "#{FileUtils::RUBY} #{"-w" if RUBY_VERSION >= '3'} spec/tilt_indirect_spec.rb"
end

task :default => :test

### RDoc

RDOC_DEFAULT_OPTS = ["--quiet", "--line-numbers", "--inline-source", '--title', 'tilt-indirect: Adds indirection for tilt templates']

begin
  gem 'hanna-nouveau'
  RDOC_DEFAULT_OPTS.concat(['-f', 'hanna'])
rescue Gem::LoadError
end

rdoc_task_class = begin
  require "rdoc/task"
  RDoc::Task
rescue LoadError
  require "rake/rdoctask"
  Rake::RDocTask
end

RDOC_OPTS = RDOC_DEFAULT_OPTS + ['--main', 'README.rdoc']

rdoc_task_class.new do |rdoc|
  rdoc.rdoc_dir = "rdoc"
  rdoc.options += RDOC_OPTS
  rdoc.rdoc_files.add %w"README.rdoc CHANGELOG MIT-LICENSE lib/**/*.rb"
end

