source "http://rubygems.org"

gemspec

### Dev
gem "rcov", "0.9.9", :platforms => :mri

### MRI 1.8
gem 'ruby-debug', :platforms => :mri_18

### MRI 1.9
# linecache19 0.5.12 cannot install on 1.9.1, and 0.5.11 appears to work with both 1.9.1 & 1.9.2
gem 'linecache19', '0.5.11', :platforms => :mri_19
gem 'ruby-debug19', :platforms => :mri_19
gem 'ruby-debug-base19', RUBY_VERSION == '1.9.1' ? '0.11.23' : '~> 0.11.24', :platforms => :mri_19

### MRI 1.8 and 1.9
gem "rb-fsevent", "~> 0.3.9", :platforms => [:mri_18, :mri_19]
gem "ruby-prof", "~> 0.9.2", :platforms => [:mri_18, :mri_19]
