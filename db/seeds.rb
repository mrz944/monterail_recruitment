# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

e = Event.create(name: 'Best event ever', date: DateTime.now + 1.year)

TicketType.create(
  name: 'standing', places: 100, price: 33.0, event: e,
  selling_options: [
    TicketType::SELLING_OPTIONS[:even]
  ]
)

TicketType.create(
  name: 'sitting', places: 50, price: 66.0, event: e,
  selling_options: [
    TicketType::SELLING_OPTIONS[:even],
    TicketType::SELLING_OPTIONS[:avoid_one]
  ]
)

TicketType.create(
  name: 'balcony', places: 10, price: 99.0, event: e,
  selling_options: [
    TicketType::SELLING_OPTIONS[:all_together]
  ]
)
