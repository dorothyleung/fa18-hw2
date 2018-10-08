class City
	attr_accessor :name, :landmark, :population, :weather
  $cities = {} # global hash to quickly access values

	def initialize(city_params)
		@name = city_params[:name]
		@landmark = city_params[:landmark]
		@population = city_params[:population]
    @weather = WeatherService.get(@name)
	end

  # save instance method
  def save
    $cities[@name.to_sym] = self
  end

  # all class method
  def self.all
    $cities
  end

  def update(update_params)
		# Your code here, for Task 4
		# Use update_params (a hash) to update the model
		@landmark = update_params[:landmark]
		@population = update_params[:population]
	end
end
