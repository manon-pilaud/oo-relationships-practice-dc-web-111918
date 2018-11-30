class Listing
  attr_accessor :city

  @@all = []

  def initialize(city)
    @city = city
    @@all << self
  end

  def self.all
    @@all
  end

  def guests
    #- returns an array of all guests who have stayed at a listing
    user_trips = Trip.all.select do |trips|
      trips.listing == self
    end
    listing_guest = user_trips.collect do |list_guest|
      list_guest.guest
    end
    listing_guest
  end

  def trips
    listing_trips = Trip.all.select do |trips|
      trips.listing == self
    end
  end

  def trip_count
    trips.count
  end

  def self.find_all_by_city(name)
    Listing.all.select do |listing|
      listing.city == name
    end
  end

  def self.most_popular
    # finds the listing that has had the most trips
  end



end


class Trip
  attr_accessor :guest, :listing

  @@all = []

  def initialize(guest,listing)
    @guest = guest
    @listing = listing
    @@all << self
  end

  def self.all
    @@all
  end
end



class Guest
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def new_trip(listing)
    Trip.new(self,listing)
  end


  def listings
    # returns an array of all listings a guest has stayed at
    user_trips = Trip.all.select do |trips|
      trips.guest == self
    end
    user_listings = user_trips.collect do |user_list|
      user_list.listing
    end
    user_listings

  end

  def trips
    user_trips = Trip.all.select do |trips|
      trips.guest == self
    end
  end

  def trip_count
    trips.count
  end

  def self.pro_traveller
    # - returns an array of all guests who have made over 1 trip
  end
  def self.find_all_by_name(name)
    Guest.all.select do |guest|
      guest.name == name
    end
  end


end
