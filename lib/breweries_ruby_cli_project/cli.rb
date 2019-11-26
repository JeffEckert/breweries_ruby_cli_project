
class BreweriesRubyCliProject::CLI

    def call
       puts "Welcome! Let's get you a beer."
       initial_query
    end

    def initial_query
        all = []
        puts "Enter the state you would like to find a Brewery in"
        # User will enter state

        input = gets.strip

        all = BreweriesRubyCliProject::APIService.query_openbrewerydb(input, all)

        all.each.with_index(1) do |b, i|
            puts "#{i}. #{b.name}"
        end

        puts "What Brewery would you like to know more about?"

        input = gets.strip

        brewery =  all[input.to_i - 1]

        pp BreweriesRubyCliProject::APIService.query_single_brewery(brewery)
        
    end


end