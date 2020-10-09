
class API

    attr_accessor 

    def get_jobs   
        uri = URI.parse("https://jobs.github.com/positions.json?markdown=true")
        response = Net::HTTP.get(uri)
        array = JSON.parse(response)
        

        array.each do |job_hash|
            job = Job.new
            job.id = job_hash["id"]
        end
    end
 #binding.pry
 #:id, :type, :created_at, :company, :location, :job_title, :job_description, :how_to_apply









end