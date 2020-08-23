require_relative 'route_fuel'
require_relative 'additional_fuel'

module Calculations

  class TotalFuel

    attr_reader :trip

    def initialize(trip)
      @trip = trip
      @total_additional_fuel = 0
    end

    def amount 
      total_routes_fuel + total_additional_fuel
    end
    
    private

    def total_additional_fuel
      route_fuel_list.inject(total_routes_fuel) do |fuel_mass, route_fuel|
        fuel_mass -= route_fuel.amount
        @total_additional_fuel += Calculations::AdditionalFuel.perform(fuel_mass, route_fuel.route.direction, route_fuel.route.gravity)
      end
    end

    def route_fuel_list
      @route_fuel_list ||= trip.routes.map do |route|
        Calculations::RouteFuel.new(route, trip.ship_mass)
      end
    end

    def total_routes_fuel
      @total_route_fuel ||= route_fuel_list.inject(0) do |result, route_fuel|
        result += route_fuel.amount
      end
    end

  end

end

