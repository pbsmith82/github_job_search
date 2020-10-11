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
                results << "Job ID: #{job.id},\nJob Type: #{job.type},\nJob Title: #{job.job_title},\nJob Location: #{job.location},\nJob Description: \r\n\r\n #{job.job_description}\r\n\r\n ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ \r\n\r\n "
            end
        end
        results                                                                                             
    end 

    # def continue                                                                                                               
    #     print "press any key"                                                                                                    
    #     STDIN.getch                                                                                                              
    #     print "            \r" # extra space to overwrite in case next sentence is short                                                                                                              
    # end


    def self.locations_list
        locations = []
        @@all.each do |job|
        locations << job.location
        end
      return locations.uniq.sort
    end  

    def self.search_by_type(type)
        results = []
        @@all.each do |job|
            if job.type.include?(type)
                results << "Job ID: #{job.id},\nJob Type: #{job.type},\nJob Title: #{job.job_title},\nJob Location: #{job.location},\nJob Description: \r\n\r\n #{job.job_description}\r\n\r\n ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ \r\n\r\n "
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
            types.each_with_index do |type, index|
            number = index + 1
            uniq_types << "\r\n#{number}: #{type}"
        end
      return uniq_types
    end 

end