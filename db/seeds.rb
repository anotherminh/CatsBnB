# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

andrew = Cat.create!(birth_date: 25.years.ago, color: 'black', name: 'Andrew', sex: 'M', description: 'Andrew is a cat. What more can I say.')

minh = Cat.create!(birth_date: 22.years.ago, color: 'orange', name: 'Minh', sex: 'M', description: 'Minh is actually a dog.')
