require 'bundler'
Bundler.setup
Bundler::GemHelper.install_tasks

# require 'appraisal'

require 'rake'
require 'rspec/core/rake_task'
require 'rspec/subject/extensions/version'

require 'cucumber/rake/task'
Cucumber::Rake::Task.new(:cucumber)

desc "Run all examples"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = %w[--color]
end

if RUBY_VERSION.to_f == 1.8
  namespace :rcov do
    task :cleanup do
      rm_rf 'coverage.data'
    end

    RSpec::Core::RakeTask.new :spec do |t|
      t.rcov = true
      t.rcov_opts = %[-Ilib -Ispec --exclude "gems/*,features"]
      t.rcov_opts << %[--no-html --aggregate coverage.data]
    end

    Cucumber::Rake::Task.new :cucumber do |t|
      t.cucumber_opts = %w{--format progress}
      t.rcov = true
      t.rcov_opts = %[-Ilib -Ispec --exclude "gems/*,features"]
      t.rcov_opts << %[--text-report --sort coverage --aggregate coverage.data]
    end
  end

  desc "run specs and cukes with rcov"
  task :rcov => ["rcov:cleanup", "rcov:spec", "rcov:cucumber"]
end

desc "Push docs/cukes to relishapp using the relish-client-gem"
task :relish, :version do |t, args|
  raise "rake relish[VERSION]" unless args[:version]
  sh "cp Changelog.md features/"
  sh "relish push ZenCocoon/rspec-subject-extensions:#{args[:version]}"
  sh "rm features/Changelog.md"
end

task :clobber do
  rm_rf 'pkg'
  rm_rf 'tmp'
  rm_rf 'coverage'
end

namespace :clobber do
  desc "remove generated rbc files"
  task :rbc do
    Dir['**/*.rbc'].each {|f| File.delete(f)}
  end
end

task :default => [:spec, :cucumber]
