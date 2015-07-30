require_relative '../../config/environment'

module LotusPart1
  class Migrator
    require 'sequel'
    def self.migrate!
      db = Sequel.connect(ENV['LOTUS_PART1_DATABASE_URL'])
    end
  end
end