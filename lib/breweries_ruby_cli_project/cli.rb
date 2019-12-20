
class BreweriesRubyCliProject::CLI

    def call
       puts "Welcome! Let's get you a beer.".green
       main_action
       second_question
       return_to_start
    end

   

    def main_action
        # all = []
        puts "Enter the state you would like to find a Brewery in. (enter the full state name)".green
       

        input = gets.strip
        
        if input == "exit"
            puts "Thanks for stoping by!".light_green
            exit
        end

         BreweriesRubyCliProject::APIService.query_openbrewerydb(input)
       
        BreweriesRubyCliProject::Brewery.all.each.with_index(1) do |b, i|
            puts "#{i}. #{b.name}".blue
        end


    end

    def second_question
        all = []
    
       
        puts "Enter the number of the Brewery you would like to learn more about.".green

        input = gets.strip

        if input == "exit"
            puts "Thanks for stoping by!".light_green
            exit
        end
        
        

        brewery =  BreweriesRubyCliProject::Brewery.all[input.to_i - 1]

        

        all = BreweriesRubyCliProject::APIService.query_single_brewery(brewery)
    #    binding.pry
       all.each.with_index(1) do |b, i|
            puts "#{i}. #{b.join(" - ")}".blue
        end
        rescue
            puts "Check the number and confirm it matches a brewery".red
            exit
        
        
    end
    

    def return_to_start
         puts "would you like to search again? enter yes or no".light_green
         input = gets.strip

         if input == "no"

            puts "Thanks for stoping by!".light_green

         else
            call
         end
    end



end