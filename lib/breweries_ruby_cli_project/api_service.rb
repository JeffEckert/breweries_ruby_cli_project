class BreweriesRubyCliProject::APIService
    BASE_URL= 'https://api.openbrewerydb.org/breweries'

    def self.query_openbrewerydb(query, all)
        results = RestClient.get("#{BASE_URL}?by_state=#{query}")

       
        json = JSON.parse(results)
        json.each do |brewery_hash|
            all << BreweriesRubyCliProject::Brewery.new(brewery_hash)
        end
        all
    end

    def self.query_single_brewery(brewery)
        results = RestClient.get("#{BASE_URL}/#{brewery.id}")

       
        json = JSON.parse(results)
        BreweriesRubyCliProject::Brewery.new(json)
    end

end
