require 'bundler/setup'
Bundler.require
require_all 'app'

joe = Guest.new("Joe")
mandy = Guest.new("Mandy")
joe2 = Guest.new("Joe")

condo = Listing.new('DC')
apt = Listing.new('NY')
home = Listing.new('NY')
binding.pry
joe.new_trip(condo)
mandy.new_trip(condo)
joe.new_trip(apt)
mandy.new_trip(home)
