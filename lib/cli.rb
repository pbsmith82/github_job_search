class CLI
    
    def start
        puts "Welcome!"
        API.get_jobs
        search
    end

    def search
        puts "What location would you like to search today?"
        location = gets.chomp
        puts "There are NEED COUNT METHOD HERE results that match your criteria!"
        puts "Would you like to see them? Yes or No"
        answer = gets.chomp
        if answer == "Yes" or answer == "y"
            puts Job.search_by_location(location)
        elsif
            answer == "No" or answer == "n"
            puts "Thats for searching locations. Have a nice day."
        else
            puts "Please enter Yes or No"
            search
        end
    end 

# How would they like to search
# List Search Options
    # Location
    # Title
    # Description
    # Company
    # Type

# Apply Open Browser Webpage.
# Track all that they have applied for.










end