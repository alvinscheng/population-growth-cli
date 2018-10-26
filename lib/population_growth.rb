require "population_growth/version"
require "thor"
require "httparty"

module PopulationGrowth
  class MyCLI < Thor
    desc "hello [name]", "say my name"
    def getPopData(zip)
      response = HTTParty.get("https://alvin-pop-growth-api.herokuapp.com/", :query => {:zip => zip})
      puts response.body
    end
  end
end

PopulationGrowth::MyCLI.start(ARGV)