require_relative '../modules/manufacturerable'
require_relative '../modules/instance_counter'

class Train
  include Manufacturerable
  include InstanceCounter

  PICK_UP_SPEED = 15

  attr_reader :number, :speed, :wagons, :route

  def self.all
    @@trains ||= []
  end

  def self.clear_all!
    @@trains = []
  end

  def self.find(number)
    @@trains.find { |train| train.number == number }
  end

  def initialize(number)
    @number = number
    @wagons = []
    @speed = 0
    @route = nil
    self.class.all << self
    register_instance
  end

  def pick_up_speed
    @speed += PICK_UP_SPEED
  end

  def stop
    @speed = 0
  end

  def hook_wagon(wagon)
    @wagons << wagon if speed.zero?
  end

  def unhook_wagon
    @wagons.delete(@wagons.last) if speed.zero?
  end

  def take_route(route)
    leave_current_station if current_station
    @route = route
    move_to_starting_station
  end

  def move_forward
    if next_station
      next_station = self.next_station

      leave_current_station

      next_station.take_train(self)
    else
      puts 'You are at the end station'
    end
    return current_station
  end

  def move_backward
    if previous_station
      previous_station = self.previous_station

      leave_current_station

      previous_station.take_train(self)
    else
      puts 'You are at the starting station'
    end
    return current_station
  end

  def current_station
    @route.stations.find { |station| station.trains.include?(self) } if @route
  end

  def next_station
    if current_station
      next_station_index = @route.stations.index(current_station) + 1
      next_station_index + 1 > @route.stations.size ? nil : @route.stations[next_station_index]
    end
  end

  def previous_station
    if current_station
      previous_station_index = @route.stations.index(current_station) - 1
      previous_station_index < 0 ? nil : @route.stations[previous_station_index]
    end
  end

  def name
    "#{self.class} - #{number}"
  end

  protected

  def leave_current_station
    current_station.send_train(self)
  end

  def move_to_starting_station
    @route.starting_station.take_train(self)
  end
end
