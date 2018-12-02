#-------------------------BEGIN CLASS Passenger---------------------------------
class Passenger
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def new_ride(driver,distance)
    Ride.new(self,driver,distance)
  end

  def self.all
    @@all
  end

  def drivers
    #returns all drivers a passenger has ridden with
    self.rides.collect do |ride|
      ride.driver
    end

  end

  def rides
    #returns all rides a passenger has been on
    Ride.all.select do |ride|
      ride.passenger == self
    end
  end

  def total_distance
    #should calculate the total distance the passenger has travelled with the service
    distance_array = self.rides.collect do |ride|
      ride.distance
    end
    distance_array.inject(0.0,:+)
  end

  def self.premium_members
    #should find all passengers who have travelled over 100 miles with the service
    hash = {}
    Ride.all.collect do |ride|
      if hash[ride.passenger]
        hash[ride.passenger] += ride.distance
      else
        hash[ride.passenger] = ride.distance
      end
      hash
    end
      hash.select {|k,v| v > 100}
  end

end
#---------------------------BEGIN CLASS Ride------------------------------------
class Ride
  attr_accessor :passenger, :driver, :distance

  @@all = []

  def initialize(passenger,driver,distance)
    @passenger = passenger
    @driver = driver
    @distance = distance
    @@all << self
  end

  def self.all
    @@all
  end

  def self.average_distance
    #should find the average distance of all rides
    distance_array = self.all.collect do |ride|
      ride.distance
    end
    sum = distance_array.inject(0.0,:+)
    sum / 2.0 if sum > 0.0
  end

end
#----------------------------BEGIN CLASS Driver---------------------------------
class Driver
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
   @@all
  end

 def passengers
  #returns all passengers a driver has had
  self.rides.collect do |ride|
    ride.passenger
  end
 end

 def rides
  #returns all rides a driver has made
  Ride.all.select do |ride|
    ride.driver == self
  end
 end


def self.mileage_cap(distance_arg)
  #takes an argument of a distance (float) and returns all drivers who have exceeded that mileage
  hash = {}
  Ride.all.collect do |ride|
    if hash[ride.driver]
      hash[ride.driver] += ride.distance
    else
      hash[ride.driver] = ride.distance
    end
    hash
  end
    hash.select {|k,v| v > distance_arg}
end

end
