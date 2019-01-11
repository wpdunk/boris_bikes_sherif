require_relative 'bike'

class DockingStation

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
     fail 'No bikes available' if empty?
     @bikes.pop
  end

  def dock(bike)
    fail 'Capacity full' if full?
    @bikes.push(bike)
    return bike
  end

  def full?
    return false unless @bikes.length > 19
    true
  end

  def empty?
    return false unless @bikes.length < 1
    true
  end

  private :full?, :empty?

end
