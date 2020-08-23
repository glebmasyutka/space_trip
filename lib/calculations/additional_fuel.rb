require_relative 'helper'

module Calculations

  module AdditionalFuel

    module_function

    def perform(fuel_amount, route_direction, route_gravity)
      additional_fuel = 0
      mass = Calculations::Helper.send("calculate_for_#{route_direction}", fuel_amount, route_gravity)

      while mass > 0
        additional_fuel += mass
        mass = Calculations::Helper.send("calculate_for_#{route_direction}", mass, route_gravity)
      end

      additional_fuel
    end

  end

end
