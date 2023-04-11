class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @airport_options = Airport.all.map{ |a| [a.city, a.id] }
  end

  def search
    flight = params[:flight]
    selected_date = Date.strptime(flight[:date], '%m/%d/%Y')
    p selected_date
    p selected_date.beginning_of_day
    p selected_date.end_of_day

    @flights = Flight.where(["departure_airport_id = ? and arrival_airport_id = ? and date BETWEEN ? AND ?", flight[:departure_airport_id], flight[:arrival_airport_id], selected_date.beginning_of_day, selected_date.end_of_day])
    p @flights
  end

  private

  def flight_params
    params.require(:flight).permit(:departure_airport_id, :arrival_airport_id, :date, :passengers)
  end
end
