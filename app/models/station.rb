class Station
  attr_reader :name, :address, :fuel_type, :distance, :access_times

  def initialize(attributes = {})
    # binding.pry

    @name = attributes[:fuel_stations][:station_name]
    @address = attributes[:fuel_stations][:street_address]
    @fuel_type = attributes[:fuel_stations][:fuel_type]
    @distance = attributes[:fuel_stations][:distance]
    @access_times = attributes[:fuel_stations][:access_days_time]
  end
end