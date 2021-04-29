# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Venue.create([
        {name: "ODalys", address: "333 Dauphin St", phone_number: "2510000000"},
        {name: "The Merry Widow", address: "111 Jackson St", phone_number: "2517777777"},
        {name: "Dan's backyard", address: "888 Fulton St", phone_number: "2518888888"}
    ])

Event.create([
        {title: "The Strays Live", date: "2021-10-17 12:56:30", description: "These guys are gonna be good!", user_id: 1, venue_id: 1},
        {title: "Backporch duo", date: "2021-10-17 12:56:30", description: "Awesome these guys will be!", user_id: 1, venue_id: 1},
        {title: "Nestled fire", date: "2021-10-17 12:56:30", description: "They'll be burning your pants down in the backyard!", user_id: 1, venue_id: 1}
    ])