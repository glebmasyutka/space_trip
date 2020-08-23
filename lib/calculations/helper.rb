module Calculations

  module Helper

    module_function

    def calculate_for_land(mass, gravity)
      (mass * gravity * 0.033 - 42).floor
    end

    def calculate_for_launch(mass, gravity)
      (mass * gravity * 0.042 - 33).floor
    end

  end

end
