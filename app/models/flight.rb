class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  def flight_date_formatted
    date.strftime("%m/%d/%Y")
  end

  def self.get_flight_dates
    flight_dates = Flight.pluck(:date).map { |a| a.strftime("%m/%d/%Y") }.uniq
  end
end
