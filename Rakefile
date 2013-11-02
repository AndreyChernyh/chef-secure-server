require 'rubygems'
require 'bundler'

require 'pathname'

require 'foodcritic'
fc_task = FoodCritic::Rake::LintTask.new
fc_task.options = { fail_tags: %w(any) }

Bundler.setup

require 'berkshelf'

# FileUtils.rm_rf('vendor/cookbooks')
# berksfile = Berkshelf::Berksfile.from_file('Berksfile')
# berksfile.install(path: 'vendor/cookbooks')

require 'rubocop/rake_task'
Rubocop::RakeTask.new

task default: %i(foodcritic knife rubocop)

desc 'Validates cookbook with "knife cookbook" command'
task :knife do
  sh "bundle exec knife cookbook test secure-server -o ../"
end
