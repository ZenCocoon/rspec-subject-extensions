source "http://rubygems.org"

### rspec libs
%w[rspec rspec-core rspec-expectations rspec-mocks].each do |lib|
  library_path = File.expand_path("../../#{lib}", __FILE__)
  if File.exist?(library_path)
    gem lib, :path => library_path
  else
    gem lib, :git => "git://github.com/rspec/#{lib}.git"
  end
end

### runtime dependencies
gem "i18n", "~> 0.6.0"
gem "activesupport", ">= 3.0"

### dev dependencies
gem "rake", "~> 0.9"
gem "cucumber", "1.0.0"
gem "aruba", "0.4.2"
gem "nokogiri", "1.4.4"

platforms :jruby do
  gem "jruby-openssl"
end

group :development do
  gem "rcov", "0.9.9", :platforms => :mri
  gem "relish", "0.4.0"
  gem 'yard', "~> 0.7.2"
  gem "guard-rspec", "0.1.9"
  gem "growl", "1.0.3"
  gem "appraisal", :git => "git://github.com/thoughtbot/appraisal.git"

  platforms :mri_18 do
    gem 'ruby-debug'
  end

  platforms :mri_19 do
    gem 'linecache19', '0.5.11' # 0.5.12 cannot install on 1.9.1, and 0.5.11 appears to work with both 1.9.1 & 1.9.2
    gem 'ruby-debug19'
    gem 'ruby-debug-base19', RUBY_VERSION == '1.9.1' ? '0.11.23' : '~> 0.11.24'
  end

  platforms :mri_18, :mri_19 do
    gem "rb-fsevent", "~> 0.3.9"
    gem "ruby-prof", "~> 0.9.2"
  end
end