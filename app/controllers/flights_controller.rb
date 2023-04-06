class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @airport_options = Airport.all.map{ |a| [a.city, a.id] }
  end
end
