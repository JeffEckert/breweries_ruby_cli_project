
class BreweriesRubyCliProject::CLI

    def call
       puts "Welcome! Let's get you a beer.".blue
       main_action
       second_question
       return_to_start
    end

    def main_action
        all = []
        puts "Enter the state you would like to find a Brewery in. (enter the full state name)".blue
       

        input = gets.strip
        

        all = BreweriesRubyCliProject::APIService.query_openbrewerydb(input, all)
       
        all.each.with_index(1) do |b, i|
            puts "#{i}. #{b.name}".red
        end

    
    


    end

    def second_question
        all = []
    
       
        puts "Enter the number of the Brewery you would like to learn more about.(If no list appears enter number 0)".blue

        input = gets.strip

        

        

        brewery =  BreweriesRubyCliProject::Brewery.all[input.to_i - 1]

        # binding.pry

        all = BreweriesRubyCliProject::APIService.query_single_brewery(brewery)

        all.each.with_index(1) do |b, i|
            puts "#{i}. #{b.join(" - ")}".red
        end
    rescue
            puts "Check your entry and confirm you are putting a full state, spelled correctly!"
        
    end
    

    def return_to_start
         puts "would you like to search again? enter yes or no".green
         input = gets.strip

         if input == "no"

            puts "Thanks for stoping by!".green

         else
            call
         end
    end



end