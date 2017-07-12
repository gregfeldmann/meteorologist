require 'open-uri'

class ForecastController < ApplicationController
  def coords_to_weather_form
    # Nothing to do here.
    render("forecast/coords_to_weather_form.html.erb")
  end

  def coords_to_weather
    @lat = params[:user_latitude]
    @lng = params[:user_longitude]

    # ==========================================================================
    # Your code goes below.
    # The latitude the user input is in the string @lat.
    # The longitude the user input is in the string @lng.
    # ==========================================================================

url = "https://api.darksky.net/forecast/ca4d02b0450b4177851d93beed7a3a81/37.8267,-122.4233"


raw_data = open(url).read
parsed_data = JSON.parse(raw_data)

  
    @current_temp = parsed_data["currently"]["temperature"]

    @current_temperature = @current_temp
    
    
    
    
    

    @current_summary = parsed_data["currently"]["summary"]

    
    

    @summary_of_next_sixty_minutes = parsed_data["minutely"]["summary"]
    

    @summary_of_next_several_hours = parsed_data["hourly"]["summary"]

    @summary_of_next_several_days = parsed_data["hourly"]["summary"]

    render("forecast/coords_to_weather.html.erb")
  end
end
