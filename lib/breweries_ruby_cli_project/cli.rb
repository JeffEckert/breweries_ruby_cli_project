
class BreweriesRubyCliProject::CLI

    def call
       puts "Welcome! Let's get you a beer."
       main_action
       second_question
       return_to_start
    end

    def main_action
        all = []
        puts "Enter the state you would like to find a Brewery in. (enter the full state name)"
       

        input = gets.strip

        all = BreweriesRubyCliProject::APIService.query_openbrewerydb(input, all)


        all.each.with_index(1) do |b, i|
            puts "#{i}. #{b.name}"
        end
    end

    def second_question
        all = []
    
       
        puts "Enter the number of the Brewery you would like to learn more about."

        input = gets.strip

        

        brewery =  BreweriesRubyCliProject::Brewery.all[input.to_i - 1]

        # binding.pry

        all = BreweriesRubyCliProject::APIService.query_single_brewery(brewery)

        all.each.with_index(1) do |b, i|
            puts "#{i}. #{b}"
        end
    
    end
    

    def return_to_start
         puts "would you like to search again? enter yes or no"
         input = gets.strip

         if input == "no"

            puts "Thanks for stoping by!"

         else
            call
         end
    end



end