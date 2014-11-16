module Horsepants
  module Monads
    class Either < Struct.new(:value, :err)
      def self.pipe(seed, *fns)
        fns.reduce(unit(seed)) do |val,fn|
          bind(val, fn)
        end
      end

      def self.unit(value)
        case value
        when Either
          value
        when Array
          new(value[0], value[1])
        when NilClass, FalseClass
          failure(value)
        else
          success(value)
        end
      end

      def self.bind(value, f)
        if !failure?(value)
          unit(f[value.value])
        else
          value
        end
      end

      def self.failure?(value)
        unit(value).failure?
      end

      def failure?
        !! err
      end

      def self.success(value)
        Either.new(value, nil)
      end

      def self.failure(err)
        Either.new(nil, err)
      end
    end

    #class Either < Struct.new(:value)
    #end
  end
end
