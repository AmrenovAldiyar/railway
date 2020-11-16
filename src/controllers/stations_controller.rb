class StationsController
  def create
    puts 'Enter station name'
    input = gets.chomp
    Station.new(input)
  end

  def all
    puts 'List of stations'
    Station.stations.each { |station| puts station.name }
  end
end