require_relative './train'

class PassengerTrain < Train
  def hook_wagon(wagon)
    if wagon.class == PassengerWagon
      super
    else
      puts "It is not passenger wagon"
    end
  end
end