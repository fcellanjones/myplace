# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "destroying seed files..."

WorkspaceAmenity.destroy_all
Amenity.destroy_all

puts "Destroyed!"

puts "Creating amenities..."

amenities = Amenity.create!([{ name: 'Speedy Wifi' }, { name: 'Sockets available' }, { name: 'Tea and Coffee' }, { name: 'Safe space' }, { name: 'Quiet spaces' }, {name: 'Screen available'}])

puts "...Amenities created!"

puts "creating workspace amenities..."
Workspace.all.each do |w|
  amenity = amenities.sample
  WorkspaceAmenity.create(workspace: w, amenity: amenity)
  amenities = amenities - [amenity]
  amenity = amenities.sample
  WorkspaceAmenity.create(workspace: w, amenity: amenity)
  amenities = amenities - [amenity]
  amenity = amenities.sample
  WorkspaceAmenity.create(workspace: w, amenity: amenity)
  amenities = amenities - [amenity]
  amenity = amenities.sample
  amenities = Amenity.all
end

puts "completed seed file!"
