class Railway

  ACTIONS = [
    { number: 1, name: 'Create station', controller: StationsController, method: :create }, 
    { number: 2, name: 'All stations', controller: StationsController, method: :index },
    { number: 3, name: 'Create train', controller: TrainsController, method: :create }, 
    { number: 4, name: 'Create route', controller: RoutesController, method: :create }, 
    { number: 5, name: 'Assign route', controller: RoutesController, method: :assign }, 
    { number: 6, name: 'Hook wagon', controller: TrainsController, method: :hook_wagon }, 
    { number: 7, name: 'Unhook wagon', controller: TrainsController, method: :unhook_wagon }, 
    { number: 8, name: 'Move train', controller: TrainsController, method: :move }, 
    { number: 9, name: 'List of trains', controller: TrainsController, method: :index }, 
    { number: 10, name: 'Exit', method: :exit }
  ]

  def start
    loop do
      puts "Choose the action"

      ACTIONS.each { |action| puts "#{action[:number]}: #{action[:name]}" }

      input = gets.chomp.to_i
      
      controller = ACTIONS.find { |action| action[:number] == input }[:controller]
      method = ACTIONS.find { |action| action[:number] == input }[:method]
      
      break if method == :exit

      controller.new.send(method)
    end
  end
end