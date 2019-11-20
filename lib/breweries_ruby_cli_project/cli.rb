
class BreweriesRubyCliProject::CLI

    def call
       puts "Welcome! Let's get you a beer."
       initial_query
       list_breweries
       menu
       brewery_details
    end

    def initial_query
        puts "Enter the state you would like to find a Brewery in"
        # User will enter state
    end


    def list_breweries
        #get local breweries based on state
        puts <<-DOC
        1.Local Brew
        2.Stateline Brew
        3.Narragansett 
        DOC
    end

    def menu 
        puts "Enter the number of the Brewery you would like to learn more about"
    end

    def brewery_details
        puts <<-DOC
        Local Brew
        Address
        Phone Number
        website
        DOC
    end
    

    


end