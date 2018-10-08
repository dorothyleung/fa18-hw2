class CitiesController < ApplicationController

  # view action to /cities/new to display a list of all cities
  def view
    render 'view'
  end

  # new action to /cities/new to display a form to create a new city
  def new
    render 'new'
  end

  # create action: handle request only for creating unique cities names
  def create
    if $cities.key?(@name)
      redirect_to :action => 'view'
    else
      new_city = City.new(
        name: params[:name],
        landmark: params[:landmark],
        population: params[:population],
      )
      new_city.save
      redirect_to :action => 'view'
    end
  end

  # updata action: only update either properties
  def update
    city = City.all[params[:name]]
    city.update(params)
    redirect_to :action => 'view'
  end

end
