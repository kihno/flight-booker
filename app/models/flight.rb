class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"


  def date_formatted
    date.strftime("%m/%d/%Y")
  end

  def self.get_flight_dates
    flight_dates = Flight.pluck(:date).map { |a| a.strftime("%m/%d/%Y") }.uniq
  end

  def self.search(params)
    unless params.nil?
      selected_date = Date.strptime(params[:date], '%m/%d/%Y')

      where(["departure_airport_id = ? and arrival_airport_id = ? and date BETWEEN ? AND ?", params[:departure_airport_id], params[:arrival_airport_id], selected_date.beginning_of_day, selected_date.end_of_day])
    end
  end
end
