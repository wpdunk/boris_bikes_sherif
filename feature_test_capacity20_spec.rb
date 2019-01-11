require './lib/docking_station.rb'
require './lib/bike.rb'
station = DockingStation.new
20.times { station.dock Bike.new }
