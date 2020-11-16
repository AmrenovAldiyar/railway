class PassengerTrainsController
  def create
    puts 'Enter passenger train number'
    input = gets.chomp
    PassengerTrain.new(input)
  end
end