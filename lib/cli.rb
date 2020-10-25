class CLI
    @@error_counter = 0

    def start
        puts "Welcome to Github Jobs!"
        API.get_jobs
        how_to_search
    end

    def how_to_search
        if @@error_counter > 2
            continue
        end
        puts "Would you like to search by location or type?"
        search = gets.chomp.downcase
        if search == "location" || search == "locations"
            search_by_location
        
        elsif 
            search == "type" || search == "types"
            search_by_type
        
        else
            puts "You must choose location or type."
            @@error_counter += 1
            how_to_search
        end
        
    end

    def continue
        puts "If you'd like to continue to searching, press Y, or press any other key to exit."
        response = STDIN.getch.downcase
        if response == "y"
            @@error_counter = 0
            how_to_search
        else
            puts "Thanks for using Githob Jobs!"
            exit
        end
    end

    def search_by_location
        if @@error_counter > 2
            continue
        end
        #binding.pry
        puts "Would you like see a list of available locations? Yes or No"
        answer = gets.chomp.downcase
        if answer == "yes" or answer == "y" 
            puts locations_list
            location_search
        elsif
            answer == "no" or answer == "n" 
            location_search
        else
            puts "Please puts Yes or No"
            @@error_counter += 1
            search_by_location
        end
    end


    def location_search
        puts "What location would you like to search for?"
        answer = gets.chomp
        answer = answer.upcase
        Job.search_by_location(answer).each do |job|
            puts "Job ID: #{job.id},\nJob Type: #{job.type},\nJob Title: #{job.job_title},\nJob Location: #{job.location},\nJob Description: \r\n\r\n #{job.job_description}\r\n\r\n ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ \r\n\r\n "
            puts "Press Q to quit, H to see how to apply, or any other key to continue."
                        input = STDIN.getch.downcase 
                        if input == "q"
                            continue
                        elsif
                            input == "h"
                            puts "\r\n HOW TO APPLY: #{job.how_to_apply}"
                            puts "\r\n Press Q to quit, or any other key to continue."
                            input = STDIN.getch.downcase 
                            if input == "q"
                                continue
                            end
                        end
        end
        puts "There are no more results." 
        continue  
    end 
    
    
    def locations_list
        Job.locations_list
    end
    

    def search_by_type
        if @@error_counter > 2
            continue
        end
        puts "Would you like see a list of available types? Yes or No"
        answer = gets.chomp.downcase
        if answer == "yes" or answer == "y" 
            puts type_list
            type_search
        elsif
            answer == "no" or answer == "n" 
            type_search
        else
            puts "Please puts Yes or No"
            @@error_counter += 1
            search_by_type
        end
    end


    def type_search
        puts "What type would you like to search for?"
        answer = gets.chomp
        #binding.pry
        if answer.to_s == answer.to_i.to_s 
            type_list.each do |type|
                if type.include?(answer)
                    type_value = type.strip.delete("#{answer}:")
                    Job.search_by_type(type_value.strip).each do |job|
                        puts "Job ID: #{job.id},\nJob Type: #{job.type},\nJob Title: #{job.job_title},\nJob Location: #{job.location},\nJob Description: \r\n\r\n #{job.job_description}\r\n\r\n ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ \r\n\r\n "
                        puts "Press Q to quit, H to see how to apply, or any other key to continue."
                        input = STDIN.getch.downcase 
                        if input == "q"
                            continue
                        elsif
                            input == "h"
                            puts "\r\n HOW TO APPLY: #{job.how_to_apply}"
                            puts "\r\n Press Q to quit, or any other key to continue."
                            input = STDIN.getch.downcase 
                            if input == "q"
                                continue
                            end
                        end
                    end 
                end
            end
        else
            answer = answer.upcase
            Job.search_by_type(answer).each do |job|
                puts job
                puts "Press Any Key to See Next Result..."
                STDIN.getch 
            end 
            puts "There are no more results."
        end
        how_to_search    
    end


    def type_list
        Job.type_list
    end

end