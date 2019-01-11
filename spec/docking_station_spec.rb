require 'docking_station'

describe DockingStation do

  it "respons to release_bike method" do
   is_expected.to respond_to(:release_bike)
 end

  it "gets a bike" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike) == Bike.new
  end

  it "bike is working" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to be_working
  end

  describe ' #dock' do
    it "docks something" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.dock(bike)).to eq subject.instance_variable_get(:@bikes).pop
    end

    it 'raises an error when the docking station is full' do
      bike = Bike.new
      docks = subject.instance_variable_get(:@capacity) + 1
      expect { (docks).times { subject.dock(bike) } }.to raise_error 'Capacity full'
    end
  end

  describe '#release_bike' do
    it "return bike" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it "raises an eror when no bikes" do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  # it "responds to full? method" do
  #  is_expected.to respond_to(:full?)
  # end
  #
  # it "fails if #full? returns true" do
  #   bike = Bike.new
  #   20.times { subject.dock(bike) }
  #   expect(subject.full?).to eq true
  # end
  #
  # it "responds to empty? method" do
  #  is_expected.to respond_to(:empty?)
  # end
  #
  # it "fails if #empty? returns true" do
  #   expect(subject.empty?).to eq true
  # end

  it "creation of new station can take an argument specifying capacity" do
    expect(subject.capacity).to eq subject.instance_variable_get(:@capacity)
  end

  it "check that default capacity is 20" do
    expect(subject.capacity).to eq 20
  end
end
