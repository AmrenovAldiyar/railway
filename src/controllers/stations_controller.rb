class StationsController
  def index
    puts 'List of stations'
    Station.stations.each { |station| puts station.name }
  end

  def create
    puts 'Enter station name'
    input = gets.chomp
    Station.new(input)
  end
end
