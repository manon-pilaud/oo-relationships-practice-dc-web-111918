require 'bundler/setup'
Bundler.require
require_all 'app'

joe = Guest.new("Joe")
mandy = Guest.new("Mandy")
joe2 = Guest.new("Joe")
rachel  = Guest.new("rachel")

condo = Listing.new('DC')
apt = Listing.new('NY')
home = Listing.new('NY')


joe.new_trip(condo)
mandy.new_trip(condo)
joe.new_trip(apt)
mandy.new_trip(home)
rachel.new_trip(condo)


 binding.pry
"Hi"
