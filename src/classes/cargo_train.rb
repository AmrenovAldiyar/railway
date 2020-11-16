require_relative './train'

class CargoTrain < Train
  def hook_wagon(wagon)
    if wagon.class == CargoWagon
      super
    else
      puts "It is not cargo wagon"
    end
  end
end
