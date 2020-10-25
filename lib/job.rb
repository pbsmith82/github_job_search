class Job

    attr_accessor :id, :type, :created_at, :company, :location, :job_title, :job_description, :how_to_apply

    @@all = []

    def initialize
        @@all << self
    end

    def self.all
        @@all
    end

    def self.search_by_location(location)
        results = []
        @@all.each do |job|
            if job.location.include?(location)
                results << job
            end
        end
        results                                                                                             
    end 

    def self.locations_list
        locations = []
        @@all.each do |job|
        locations << job.location
        end
      locations.uniq.sort
    end  

    def self.search_by_type(type)
        results = []
        @@all.each do |job|
            if job.type.include?(type)
                results << job
            end
        end
        results                                                                                          
    end 

    def self.type_list
            types = []
            uniq_types = []
            @@all.each_with_index do |job|
            types << job.type
        end
            types = types.uniq.sort
            types.each.with_index(1) do |type, index|
            uniq_types << "\r\n#{index}: #{type}"
        end
      uniq_types
    end 

end