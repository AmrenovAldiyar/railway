require_relative '../modules/instance_counter'

class Route
  include InstanceCounter
  
  attr_reader :starting_station, :end_station, :intermediate_stations

  def self.all
    @@routes ||= []
  end

  def initialize(starting_station, end_station)
    @starting_station = starting_station
    @end_station = end_station
    @intermediate_stations = []
    self.class.all << self
    register_instance
  end

  def add_intermediate_station(intermediate_station)
    @intermediate_stations << intermediate_station if intermediate_station != starting_station && intermediate_station != end_station
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

  def name
    "#{starting_station.name} - #{end_station.name}"
  end
end