# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

andrew = Cat.create!(birth_date: 25.years.ago, color: 'black', name: 'Andrew', sex: 'M', description: 'Andrew is a cat. What more can I say.')

minh = Cat.create!(birth_date: 22.years.ago, color: 'orange', name: 'Minh', sex: 'M', description: 'Minh is actually a dog.')

chairman_meow = Cat.create!(birth_date: 22.years.ago, color: 'orange', name: 'Chairman Meow', sex: 'M', description: 'Minh is actually a dog.')

purrtin = Cat.create!(birth_date: 22.years.ago, color: 'orange', name: 'Purrtin', sex: 'M', description: 'Minh is actually a dog.')


rental_1 = CatRentalRequest.create!(cat_id: chairman_meow.id, start_date: 5.days.ago, end_date: 2.days.ago)

rental_2 = CatRentalRequest.create!(cat_id: chairman_meow.id, start_date: 10.days.ago, end_date: 6.days.ago)

rental_3 = CatRentalRequest.create!(cat_id: purrtin.id, start_date: 3.days.ago, end_date: 1.days.ago)
