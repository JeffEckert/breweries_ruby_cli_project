class BreweriesRubyCliProject::Brewery 
    
    attr_accessor :id, :name, :brewery_type, :street, :city, :state, :postal_code, :country, :longitude, :latitude, :phone, :website_url

    @@all = []

    def initialize(args)
        args.each do |k,v|
            self.send("#{k}=", v) if self.respond_to?(k)
        end
        @@all << self
    end

    def self.all
        @@all
    end


end