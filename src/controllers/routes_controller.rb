class RoutesController
  
  ACTIONS = [
    { number: 1, name: 'Add new intermediate station', method: :add_intermediate_station }, 
    { number: 2, name: 'Remove existing intermediate station', method: :remove_intermediate_station }, 
    { number: 3, name: 'Exit', method: :exit }
  ]

  def create
    starting_station = StationsController.new.send(:create)
    end_station = StationsController.new.send(:create)
    route = Route.new(starting_station, end_station)
    manage_intermediate_stations(route)
  end

  def assign
    puts "Choose the route"
    Route.routes.each_with_index do |route, index|
      puts "#{index + 1}: #{route.name}"
    end
    input = gets.chomp.to_i
    route = Route.routes[ input- 1]

    puts "Choose the train"
    Train.trains.each_with_index do |train, index|
      puts "#{index + 1}: #{train.name}"
    end
    input = gets.chomp.to_i
    train = Train.trains[ input- 1]

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
    intermediate_station = StationsController.new.send(:create)
    route.add_intermediate_station(intermediate_station)
  end

  def remove_intermediate_station(route)
    puts "Choose intermediate station to remove"
    route.intermediate_stations.each_with_index do |intermediate_station, index|
      puts "#{index + 1}: #{intermediate_station.name}"
    end
    input = gets.chomp.to_i
    intermediate_station_to_remove = route.intermediate_stations[ input- 1]
    route.remove_intermediate_station(intermediate_station_to_remove)
  end
end