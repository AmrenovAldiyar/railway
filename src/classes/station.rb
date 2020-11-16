class Station
  attr_reader :name, :trains

  @@stations = []

  def self.stations
    @@stations    
  end

  def initialize(name)
    @name = name
    @trains = []
    @@stations << self
  end

  def take_train(train)
    @trains << train
  end

  def send_train(train)
    @trains.delete(train)
  end
end
