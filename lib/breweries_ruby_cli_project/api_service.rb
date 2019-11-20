class BreweriesRubyCliProject::APIService
    BASE_URL= 'https://api.openbrewerydb.org/breweries'

    def self.query_openbrewerydb(query)
        result = RestClient.get("#{BASE_URL}/?by_state&query=#{query}")

        binding.pry

    end


end