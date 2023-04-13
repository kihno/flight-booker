class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map{ |a| [a.city, a.id] }
    @available_flights = Flight.search((params[:flight]))
  end

  def search
    @flight = params[:flight]
    selected_date = Date.strptime(@flight[:date], '%m/%d/%Y')

    @flights = Flight.where(["departure_airport_id = ? and arrival_airport_id = ? and date BETWEEN ? AND ?", @flight[:departure_airport_id], @flight[:arrival_airport_id], selected_date.beginning_of_day, selected_date.end_of_day])
  end
end
