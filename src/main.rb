require_relative './classes/station'
require_relative './classes/route'
require_relative './classes/train'
require_relative './classes/passenger_train'
require_relative './classes/cargo_train'
require_relative './classes/passenger_wagon'
require_relative './classes/cargo_wagon'
require_relative './controllers/stations_controller'
require_relative './controllers/passenger_trains_controller'
require_relative './controllers/cargo_trains_controller'
require_relative './controllers/trains_controller'
require_relative './controllers/routes_controller'
require_relative './railway'

railway = Railway.new
railway.start