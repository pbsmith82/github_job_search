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
        @@all.select do |job|
            if job.location.include?(location)
                return "#{job.id}, #{job.type}, #{job.job_title}, #{job.location}, #{job.job_description}"
            end
        end
    end 



end