class RoutesController
  
  ACTIONS = [
    { number: 1, name: 'Add new intermediate station', method: :add_intermediate_station }, 
    { number: 2, name: 'Remove existing intermediate station', method: :remove_intermediate_station }, 
    { number: 3, name: 'Exit', method: :exit }
  ]

  def create
    puts "Choose the starting station"
    starting_station = choose_station
    puts "Choose the end station"
    end_station = choose_station
    route = Route.new(starting_station, end_station)
    manage_intermediate_stations(route)
  end

  def assign
    route = choose_route
    train = choose_train
    train.take_route(route)
  end

  private

  def manage_intermediate_stations(route)
    loop do
      ACTIONS.each { |action| puts "#{action[:number]}: #{action[:name]}" }

      input = gets.chomp.to_i

      method = ACTIONS.find { |action| action[:number] == input }[:method]

      break if method == :exit

      self.send(method, route)
    end
  end

  def add_intermediate_station(route)
    puts "Choose intermediate station"
    intermediate_station = choose_station
    route.add_intermediate_station(intermediate_station)
  end

  def remove_intermediate_station(route)
    puts "Choose intermediate station to remove"
    intermediate_station_to_remove = choose_intermediate_station(route)
    route.remove_intermediate_station(intermediate_station_to_remove)
  end

  def choose_route
    puts "Choose the route"
    Route.routes.each_with_index do |route, index|
      puts "#{index + 1}: #{route.name}"
    end
    input = gets.chomp.to_i
    Route.routes[input - 1]
  end

  def choose_train
    puts "Choose the train"
    Train.trains.each_with_index do |train, index|
      puts "#{index + 1}: #{train.name}"
    end
    input = gets.chomp.to_i
    Train.trains[input - 1]
  end

  def choose_station
    Station.stations.each_with_index do |station, index|
      puts "#{index + 1}: #{station.name}"
    end
    input = gets.chomp.to_i
    Station.stations[input - 1]
  end

  def choose_intermediate_station(route)
    route.intermediate_stations.each_with_index do |intermediate_station, index|
      puts "#{index + 1}: #{intermediate_station.name}"
    end
    input = gets.chomp.to_i
    route.intermediate_stations[input - 1]
  end
end