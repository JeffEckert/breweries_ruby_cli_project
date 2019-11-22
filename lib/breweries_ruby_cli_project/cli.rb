
class BreweriesRubyCliProject::CLI

    def call
       puts "Welcome! Let's get you a beer."
       initial_query
       menu
       brewery_details
    end

    def initial_query
        puts "Enter the state you would like to find a Brewery in"
        # User will enter state

        input = gets.strip

        BreweriesRubyCliProject::APIService.query_openbrewerydb(input)

        BreweriesRubyCliProject::Brewery.all.each.with_index(1) do |b, i|
            puts "#{i}. #{b.name}"
        end

        puts "What Brewery would you like to know more about?"

        input = gets.strip

        brewery =  BreweriesRubyCliProject::Brewery.all[input.to_i - 1]

        BreweriesRubyCliProject::APIService.query_single_brewery(brewery)

    end

    

    
    

    


end