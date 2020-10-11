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
    end

    binding.pry

    def how_to_search

        puts "Would you like to search by location or type?"
        #puts "You can search by locations."
        search = gets.chomp
        search = search.downcase
        if search == "location" or search == "locations"
            search_by_location
        
        elsif 
            search == "type" 
            search_by_type
        
        else
            puts "Sorry you must search by location."
            how_to_search
        end

    end


    def search_by_location
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
            search_by_location
        end
    end


    def location_search
        puts "What location would you like to search for?"
        answer = gets.chomp
        answer = answer.upcase
        puts Job.search_by_location(answer)
        how_to_search   
    end 
    
    
    def locations_list
        puts Job.locations_list
    end
    

    def search_by_type
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
            search_by_type
        end
    end

    def type_search
        puts "What type would you like to search for?"
        answer = gets.chomp
        answer = answer.upcase
        puts Job.search_by_type(answer)
        how_to_search    
    end

    def type_list
        puts Job.type_list
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