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

flights = {
  LAX: { JFK: 19800, LHR: 37440, FCO: 42840, HND: 42300 },
  JFK: { LAX: 19800, LHR: 25920, FCO: 32040, HND: 51120 },
  LHR: { JFK: 25920, LAX: 37440, FCO: 9360, HND: 50400 },
  FCO: { JFK: 32040, LHR: 9360, LAX: 42840, HND:  45000},
  HND: { JFK: 51120, LHR: 50400, FCO: 45000, LAX: 42300 }
}

flights.each do |origin, destinations|
  destinations.each do |destination, duration|
    date = DateTime.now
    for i in 0..7
      Flight.create(
        :departure_airport => Airport.find_by(code: origin),
        :arrival_airport => Airport.find_by(code: destination),
        :date => date + i,
        :duration => duration
      )
    end
  end
end

# Flight.create([
#   {
#     departure_airport: Airport.all[0],
#     arrival_airport: Airport.all[1],
#     date: DateTime.new(2023, 7, 8, 8, 5),
#     duration: 19800,
#   },
#   {
#     departure_airport: Airport.all[1],
#     arrival_airport: Airport.all[2],
#     date: DateTime.new(2023, 7, 8, 18, 5),
#     duration: 25920,
#   },
#   {
#     departure_airport: Airport.all[2],
#     arrival_airport: Airport.all[3],
#     date: DateTime.new(2023, 7, 8, 21, 5),
#     duration: 9360,
#   },
#   {
#     departure_airport: Airport.all[0],
#     arrival_airport: Airport.all[4],
#     date: DateTime.new(2023, 7, 8, 9, 5),
#     duration: 42300,
#   }
# ])

p "Created #{Flight.count} Flights"
