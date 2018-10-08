# Lab1 weather 
require_relative "../services/weather_service"

class MainController < ApplicationController

  def index
    # Uncomment and pass a parameter to the get function
    @city = params[:city]
    @w = WeatherService.get(@city)
    if @w
      @temperature = (@w[:temperature] - 273) * (9 / 5) + 32 # convert Kelvin -> Fahrenheit
      # create a new city (object)
      city = City.new(
        name: @city,
        temperature: @temperature,
        description: @w[:description]
      )
    # save the new city just created to global cities hash
    city.save
    end
  end

end
