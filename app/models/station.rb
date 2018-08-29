class Station
  attr_reader :name, :address, :fuel_type, :distance, :access_times

  def initialize(attributes = {})

    @name = attributes[:station_name]
    @address = attributes[:street_address]
    @fuel_type = attributes[:fuel_type]
    @distance = attributes[:distance]
    @access_times = attributes[:access_days_time]
  end
end