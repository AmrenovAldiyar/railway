require_relative '../modules/instance_counter'

class Station
  include InstanceCounter
  
  attr_reader :name, :trains

  def self.all
    @@stations ||= [] 
  end

  def initialize(name)
    @name = name
    @trains = []
    self.class.all << self
    register_instance
  end

  def take_train(train)
    @trains << train
  end

  def send_train(train)
    @trains.delete(train)
  end
end
