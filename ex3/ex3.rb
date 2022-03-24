# frozen_string_literal: true

module Ex3
  class NormalClass
    attr_accessor :num

    def initialize
      self.num = 0
    end

    def add(n)
      self.num += n
    end
  end

  class MetaClass
    attr_accessor :num

    def initialize
      self.num = 0
    end

    private

    def method_missing(method_name, *args)
      case method_name
      when :add
        self.num += args[0]
      else
        super(method_name, args)
      end
    end

    def respond_to_missing?(method_name, include_private = false)
      %i[add].include?(method_name) || super
    end
  end
end