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

  def all
    puts 'All trains'
    Train.trains.each { |train| puts "#{train.class.to_s} - #{train.number}" }
  end

  def hook_wagon
    puts "Choose the train"
    Train.trains.each_with_index do |train, index|
      puts "#{index + 1}: #{train.name}"
    end
    input = gets.chomp.to_i
    train = Train.trains[ input- 1]

    train.class.to_s == 'PassengerTrain' ? train.hook_wagon(PassengerWagon.new) : train.hook_wagon(CargoWagon.new)
    puts "Wagon hooked up successfuly"
  end

  def unhook_wagon
    puts "Choose the train"
    Train.trains.each_with_index do |train, index|
      puts "#{index + 1}: #{train.name}"
    end
    input = gets.chomp.to_i
    train = Train.trains[ input- 1]

    if train.wagons.any?
      train.unhook_wagon
      puts "Wagon unhooked successfuly"
    else
      puts "Train has no wagons"
    end
  end

  def move_train
    puts "Choose the train"
    Train.trains.each_with_index do |train, index|
      puts "#{index + 1}: #{train.name}"
    end
    input = gets.chomp.to_i
    train = Train.trains[ input- 1]

    if train.route
      manage_train_movement(train)
    else
      puts "Train has no route to move"
    end
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