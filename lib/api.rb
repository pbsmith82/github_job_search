
class API

    def self.get_jobs   
        url = "https://jobs.github.com/positions.json?markdown=true"

        uri = URI(url)
        response = Net::HTTP.get(uri)
        array = JSON.parse(response)
        
        array.each do |job_hash|
             job = Job.new
             job.id = job_hash["id"]
             job.type = job_hash["type"].upcase
             job.created_at = job_hash["created_at"]
             job.company = job_hash["company"].upcase
             job.location = job_hash["location"].upcase 
             job.job_title = job_hash["title"].upcase
             job.job_description = job_hash["description"]
             job.how_to_apply = job_hash["how_to_apply"]
        end
        #binding.pry
    end
 
end