require 'bundler/setup'
Bundler.require
require_all 'app'


#---------------------------Airbnb Lab----------------------------------------
# joe = Guest.new("Joe")
# mandy = Guest.new("Mandy")
# joe2 = Guest.new("Joe")
# rachel  = Guest.new("rachel")
#
# condo = Listing.new('DC')
# apt = Listing.new('NY')
# home = Listing.new('NY')
#
#
# joe.new_trip(condo)
# mandy.new_trip(condo)
# joe.new_trip(apt)
# mandy.new_trip(home)
# rachel.new_trip(condo)

#----------------------------Lyft Lab------------------------------------------
jc = Passenger.new('JC')
anuj = Passenger.new('Anuj')

richard = Driver.new('Richard')
james = Driver.new('James')

trip1 = jc.new_ride(james,3.5)
trip2= anuj.new_ride(richard,1)
trip3 = anuj.new_ride(richard,2.6)
trip4 =  anuj.new_ride(james,3.7)
trip5 = anuj.new_ride(james,100)
binding.pry
"Hi"
