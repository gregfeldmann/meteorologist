require 'open-uri'

class MeteorologistController < ApplicationController
  def street_to_weather_form
    # Nothing to do here.
    render("meteorologist/street_to_weather_form.html.erb")
  end

  def street_to_weather
    @street_address = params[:user_street_address]

    # ==========================================================================
    # Your code goes below.
    #
    # The street address that the user typed is in the variable @street_address.
    # ==========================================================================

url = "https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA"

raw_data = open(url).read
parsed_data = JSON.parse(raw_data)


    @latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
    
    

    @longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

url = "https://api.darksky.net/forecast/ca4d02b0450b4177851d93beed7a3a81/37.8267,-122.4233"


raw_data = open(url).read
parsed_data = JSON.parse(raw_data)

@current_temp = parsed_data["currently"]["temperature"]

    @current_temperature = @current_temp

    @current_summary = parsed_data["currently"]["summary"]

    @summary_of_next_sixty_minutes = parsed_data["minutely"]["summary"]

    @summary_of_next_several_hours = parsed_data["hourly"]["summary"]

    @summary_of_next_several_days = parsed_data["hourly"]["summary"]

    render("meteorologist/street_to_weather.html.erb")
  end
end
