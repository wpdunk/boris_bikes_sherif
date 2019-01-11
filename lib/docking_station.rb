require_relative 'bike'

class DockingStation

  attr_reader :bikes, :capacity

  # DEFAULT_CAPACITY = 20

  def initialize(capacity = 20)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
     fail 'No bikes available' if empty?
     @bikes.pop
  end

  def dock(bike, status = true)
    @capacity -= 1 if !status
    fail 'Capacity full' if full?
    @bikes.push(bike)
    return bike
  end

  def full?
    return false unless @bikes.length > @capacity-1
    true
  end

  def empty?
    return false unless @bikes.length < 1
    true
  end



  private :full?, :empty?

end
