require_relative "./api.rb"
require_relative "./job.rb"

require 'pry'
require 'net/http'
require 'open-uri'
require 'json'

class CLI
    
    def start
        puts "Welcome!"
        API.get_jobs
        how_to_search
        #search_by_location
        #locations_list

    end
    #binding.pry

    def how_to_search

        puts "How would you like to search Github job listing?"
        puts "You can search by locations."
        search = gets.chomp
        if search == "location" or search == "locations"
            search_by_location
        else
            puts "Sorry you must search by location"
            how_to_search
        end

    end


    def search_by_location
        puts "Would you like see a list of available locations? Yes or No"
        answer = gets.chomp
        if answer == "Yes" or answer == "y"
            puts locations_list
            location_search
        elsif
            answer == "No" or answer == "n"
            location_search
        else
            puts "Please puts Yes or No"
            search_by_location
        end
    end

    def location_search
        puts "What location would you like to search for?"
        answer = gets.chomp
        puts Job.search_by_location(answer)
        location_search
    end 

    
    
    
    
    def locations_list
        puts Job.locations_list
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