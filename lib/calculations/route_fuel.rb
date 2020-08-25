module Calculations

  class RouteFuel

    attr_reader :route, :ship_mass

    def initialize(route, ship_mass)
      @route = route
      @ship_mass = ship_mass
    end

    def amount
      fuel_for_ship_mass = Calculations::Helper.send("calculate_for_#{route.direction}", ship_mass, route.gravity)  
      additional_fuel = Calculations::AdditionalFuel.amount(fuel_for_ship_mass, route.direction, route.gravity)

      fuel_for_ship_mass + additional_fuel
    end

  end

end

