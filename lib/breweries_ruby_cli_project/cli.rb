
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

         # Write code to check if the Brewery class is empty.
         # If it is, display an error message that no breweries were found.
         # Then, rerun your main program loop.

        #  if BreweriesRubyCliProject::Brewery.all.empty?
        #     puts 'No breweries found here. Please make sure you have entered the full state name correctly.'.red
        #     main_action
        #  end

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
        
        # Validate user input. If they enter an invalid number, ask them to re-enter it.
        # Rerun the secondary loop.

        # if !input.to_i.between?(1,BreweriesRubyCliProject::Brewery.all.length)
        #     puts "Check the number and confirm it matches a brewery".red
        #     second_question
        # end

        brewery =  BreweriesRubyCliProject::Brewery.all[input.to_i - 1]

        
        all = BreweriesRubyCliProject::APIService.query_single_brewery(brewery)

       all.each.with_index(1) do |b, i|
            puts "#{i}. #{b.join(" - ")}".blue
        end

        # After the user enters the brewery and is returned info, let them search again if they'd like
     
        # return_to_start

        
        
    end
    

    def return_to_start
         puts "would you like to search again? enter yes or no".light_green
         input = gets.strip

         if input == "no"

            puts "Thanks for stoping by!".light_green
            
            # How will you break out of the program after saying goodbye?

            # exit
         else
            call
         end
    end



end