class TrainsController
  ACTIONS = [
    { number: 1, name: 'Create passenger train', controller: PassengerTrainsController, method: :create }, 
    { number: 2, name: 'Create cargo train', controller: CargoTrainsController, method: :create }, 
    { number: 3, name: 'Exit', method: :exit }
  ]

  MOVE_ACTIONS = [
    { number: 1, name: 'Move forward', method: :move_forward }, 
    { number: 2, name: 'Move backward', method: :move_backward }, 
    { number: 3, name: 'Exit', method: :exit }
  ]

  def create
    ACTIONS.each { |action| puts "#{action[:number]}: #{action[:name]}" }
    input = gets.chomp.to_i
    controller = ACTIONS.find { |action| action[:number] == input }[:controller]
    method = ACTIONS.find { |action| action[:number] == input }[:method]
    controller.new.send(method)
  end

  def index
    puts 'All trains'
    Train.trains.each { |train| puts train.name }
  end

  def hook_wagon
    train = choose_train 
    wagon = train.class == PassengerTrain ? PassengerWagon.new : CargoWagon.new
    train.hook_wagon(wagon)
  end

  def unhook_wagon
    train = choose_train
    train.unhook_wagon if train.wagons.any?
  end

  def move
    train = choose_train

    manage_train_movement(train) if train.route
  end

  private

  def choose_train
    puts "Choose the train"
    Train.trains.each_with_index do |train, index|
      puts "#{index + 1}: #{train.name}"
    end
    input = gets.chomp.to_i
    Train.trains[input - 1]
  end

  def manage_train_movement(train)
    loop do
      MOVE_ACTIONS.each { |move_action| puts "#{move_action[:number]}: #{move_action[:name]}" }

      input = gets.chomp.to_i

      method = MOVE_ACTIONS.find { |move_action| move_action[:number] == input }[:method]

      break if method == :exit

      self.send(method, train)
    end
  end

  def move_forward(train)
    train.move_forward
  end

  def move_backward(train)
    train.move_backward
  end
end