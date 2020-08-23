require_relative 'calculations/total_fuel'

class SpaceTrip
 
  attr_reader :ship_mass, :routes

  Route = Struct.new(:direction, :gravity)

  def initialize(ship_mass, data)
    @ship_mass = ship_mass
    @routes = routify(data)
  end

  def fuel_required
    Calculations::TotalFuel.new(self).amount
  end

  private

  def routify(data)
    data.map do |(direction, gravity)|
      Route.new(direction, gravity)
    end
  end

end

