
class API

    URLS = ["https://jobs.github.com/positions.json?page=1&markdown=true","https://jobs.github.com/positions.json?page=2&markdown=true","https://jobs.github.com/positions.json?page=3&markdown=true"]

    def self.get_jobs   

        URLS.each do |url|
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
        end

    end
 
end