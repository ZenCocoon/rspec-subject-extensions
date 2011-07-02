require 'bundler'
Bundler.setup
Bundler::GemHelper.install_tasks

require 'rake'
require 'rspec/core/rake_task'
require 'cucumber/rake/task'
require 'appraisal'

require 'rspec/subject/extensions/version'

desc "Default: Run all specs and features for each appraisal"
task :default => [:spec, :cucumber] do
  if File.exist?('gemfiles')
    system('bundle exec rake -s appraisal spec cucumber;')
  else
    puts "\033[36mYou need to run `rake appraisal:install` for testing with each appraisale\033[0m"
  end
end

desc "Run all specs"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = %w[--color]
end

Cucumber::Rake::Task.new(:cucumber)

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
  rm 'coverage.data'
end

namespace :clobber do
  desc "remove generated rbc files"
  task :rbc do
    Dir['**/*.rbc'].each {|f| File.delete(f)}
  end
end
