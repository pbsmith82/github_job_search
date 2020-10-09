class Job

    attr_accessor :id, :type, :created_at, :company, :location, :job_title, :job_description, :how_to_apply

    @@all = []

    def initialize
        @@all << self
    end

    def self.all
        @@all
    end



end