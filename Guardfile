# A sample Guardfile
# More info at https://github.com/guard/guard#readme


guard :rspec, all_on_start: true, cmd: 'rspec --color --format documentation' do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})  { "spec" }
  watch('spec/spec_helper.rb')  { "spec" }
end

