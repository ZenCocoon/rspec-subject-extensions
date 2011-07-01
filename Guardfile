guard 'rspec', :version => 2 do
  watch(/^spec\/(.*)_spec.rb/)
  watch(/^lib\/(.*)\.rb/) { |m| "spec/#{m[1]}_spec.rb" }
  watch(/^spec\/spec_helper.rb/) { "spec" }
end

guard 'cucumber' do
  watch(%r{^features/.+\.feature$})
  watch(%r{^features/support/.+$})          { 'features' }
  watch(%r{^features/step_definitions/(.+)_steps\.rb$}) { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'features' }
end
