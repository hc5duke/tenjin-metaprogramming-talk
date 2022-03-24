# frozen_string_literal: true

module Ex2
  class City
    INSTANCE_VARIABLES = %i[place_name population]
    attr_accessor *INSTANCE_VARIABLES

    def initialize(place_name: nil, population: nil)
      self.place_name = place_name
      self.population = population

      @@cities << self
    end

    class << self
      @@cities = []

      def method_missing(method_name, *args)
        attr = method_name.to_s[8..-1].to_sym
        super(method_name, args) unless INSTANCE_VARIABLES.include?(attr)
        @@cities.each do |city|
          return city if city.send(attr) == args[0]
        end

        nil
      end

      def respond_to_missing?(method_name, include_private = false)
        return true if method_name.to_s.match(/^find_by_/)

        super
      end
    end
  end
end