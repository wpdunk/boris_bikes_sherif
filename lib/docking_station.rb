require_relative 'bike'

class DockingStation

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
     fail 'No bikes available' unless @bikes.length > 0
     @bikes.pop
  end

  def dock(bike)
    fail 'Capacity full' if @bikes.length > 19
    @bikes.push(bike)
    return bike
  end

end
