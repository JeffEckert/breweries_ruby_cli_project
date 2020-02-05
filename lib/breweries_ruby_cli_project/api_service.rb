class BreweriesRubyCliProject::APIService
    BASE_URL= 'https://api.openbrewerydb.org/breweries'

    def self.query_openbrewerydb(query)

        # Add some code to clear all the old API search data from the Brewery class

        # BreweriesRubyCliProject::Brewery.all.clear
        results = RestClient.get("#{BASE_URL}?by_state=#{query}")

 
        json = JSON.parse(results)

        # Move this logic from your API class to your CLI class. Where else can you check to see whether or not any breweries were found?

        # if json == []
        #     puts "You have entered the state name incorrectly Please try again.".red
        #     exit
        # end
        json.each do |brewery_hash|
             BreweriesRubyCliProject::Brewery.new(brewery_hash)
        end
    end

    def self.query_single_brewery(brewery)
        results = RestClient.get("#{BASE_URL}/#{brewery.id}")

  
        json = JSON.parse(results)
         brewery.update(json)


    end

end
