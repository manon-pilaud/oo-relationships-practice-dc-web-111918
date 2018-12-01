#------------------------BEGIN LISTING CLASS--------------------------------------

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
    listing_hash = {}
    Trip.all.each do |trip|
      if listing_hash[trip.listing]
        listing_hash[trip.listing] += 1
      else
        listing_hash[trip.listing] = 1
      end
    end
    listing_hash.sort_by{|k,v| v}[-1][0]
  end

end

#------------------------BEGIN TRIP CLASS--------------------------------------

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

#------------------------BEGIN GUEST CLASS--------------------------------------


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
    guest_hash = {}
    Trip.all.each do |trip|
      if guest_hash[trip.guest]
        guest_hash[trip.guest] +=1
      else
        guest_hash[trip.guest] =1
      end
    end
    new_hash = guest_hash.select{|k,v| v>1}
    new_hash.keys
  end

  def self.find_all_by_name(name)
    Guest.all.select do |guest|
      guest.name == name
    end
  end


end
