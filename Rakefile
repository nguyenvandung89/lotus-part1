require 'rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)
task default: :spec

#rake task create db from db/seeds.rb file
namespace :db do
  task :migrate do
    require_relative 'lib/lotus-part1/migrator'
    LotusPart1::Migrator.migrate!
  end

  task :seed => [:migrate] do
    load 'db/seeds.rb'
  end
end
