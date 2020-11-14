class Route
  attr_reader :starting_station, :end_station, :intermediate_stations

  def initialize(starting_station, end_station)
    @starting_station = starting_station
    @end_station = end_station
    @intermediate_stations = []
  end

  def add_intermediate_station(intermediate_station)
    @intermediate_stations << intermediate_station
  end

  def remove_intermediate_station(intermediate_station)
    @intermediate_stations.delete(intermediate_station)
  end

  def stations
    stations = []
    stations << @starting_station
    @intermediate_stations.each { |intermediate_station| stations << intermediate_station }
    stations << @end_station
    return stations
  end
end