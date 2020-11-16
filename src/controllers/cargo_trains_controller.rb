class CargoTrainsController
  def create
    puts 'Enter cargo train number'
    input = gets.chomp
    CargoTrain.new(input)
  end
end