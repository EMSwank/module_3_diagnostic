class Station
  attr_reader :name, :address, :fuel_type, :distance, :access_times

  def initialize(attributes = {})
    @name = attributes[:name]
    @name = attributes[:address]
    @name = attributes[:fuel_type]
    @name = attributes[:distance]
    @name = attributes[:access_times]
  end
end