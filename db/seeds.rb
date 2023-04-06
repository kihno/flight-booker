# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Airport.delete_all
Flight.delete_all

Airport.create([
  {
    city: 'Los Angeles',
    code: 'LAX'
  },
  {
    city: 'New York',
    code: 'JFK'
  },
  {
    city: 'London',
    code: 'LHR'
  },
  {
    city: 'Rome',
    code: 'FCO'
  },
  {
    city: 'Tokyo',
    code: 'HND'
  }
])

p "Created #{Airport.count} Airports"

Flight.create([
  {
    departure_airport: Airport.all[0],
    arrival_airport: Airport.all[1],
    date: DateTime.new(2023, 7, 8, 8, 5),
    duration: 19800,
  },
  {
    departure_airport: Airport.all[1],
    arrival_airport: Airport.all[2],
    date: DateTime.new(2023, 7, 8, 18, 5),
    duration: 25920,
  },
  {
    departure_airport: Airport.all[2],
    arrival_airport: Airport.all[3],
    date: DateTime.new(2023, 7, 8, 21, 5),
    duration: 9360,
  },
  {
    departure_airport: Airport.all[0],
    arrival_airport: Airport.all[4],
    date: DateTime.new(2023, 7, 8, 9, 5),
    duration: 42300,
  }
])

p "Created #{Flight.count} Flights"
