
class BreweriesRubyCliProject::CLI

    def call
       puts "Welcome! Let's get you a beer."
       main_action
       return_to_start
    end

    def main_action
        all = []
        puts "Enter the state you would like to find a Brewery in"
       

        input = gets.strip

        all = BreweriesRubyCliProject::APIService.query_openbrewerydb(input, all)

        all.each.with_index(1) do |b, i|
            puts "#{i}. #{b.name}"
        end
    
       
        puts "What Brewery would you like to know more about?"

        input = gets.strip

        brewery =  BreweriesRubyCliProject::Brewery.all[input.to_i - 1]

        # binding.pry

        pp BreweriesRubyCliProject::APIService.query_single_brewery(brewery)

    
        
    end

    def return_to_start
         puts "would you like to search again?"
         input = gets.strip

         if input == "no"

            puts "Thanks for stoping by!"

         else
            call
         end
    end



end