# frozen_string_literal: true

module Ex0
  class Dog
    def initialize(new_name)
      self.name = new_name
    end

    def greet
      name
    end

    private

    attr_accessor :name
  end
end
