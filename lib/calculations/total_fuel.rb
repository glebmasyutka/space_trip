module Calculations

  autoload :RouteFuel, 'calculations/route_fuel'
  autoload :AdditionalFuel, 'calculations/additional_fuel'
  autoload :Helper, 'calculations/helper'

  class TotalFuel

    attr_reader :trip

    def initialize(trip)
      @trip = trip
      @total_additional_fuel = 0
      @total_routes_fuel = 0
    end

    def amount 
      total_routes_fuel + total_additional_fuel
    end
    
    private

    def total_additional_fuel
      route_fuel_list.inject(total_routes_fuel) do |total_fuel_amount, route_fuel|
        total_fuel_amount -= route_fuel.amount
        @total_additional_fuel += AdditionalFuel.amount(total_fuel_amount, route_fuel.route.direction, route_fuel.route.gravity)
      end
    end

    def route_fuel_list
      @route_fuel_list ||= trip.routes.map do |route|
        RouteFuel.new(route, trip.ship_mass)
      end
    end

    def total_routes_fuel
      @total_route_fuel ||= route_fuel_list.inject(@total_routes_fuel) do |result, route_fuel|
        result += route_fuel.amount
      end
    end

  end

end

