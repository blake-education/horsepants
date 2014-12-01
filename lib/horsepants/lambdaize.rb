module Horsepants
  module Lambdaize
    def lambdas
      @lambdas ||= LambdaProxy.new(self)
    end

    class LambdaProxy < Struct.new(:target, :ctx)
      def initialize(*)
        super
        self.ctx = Object.new
        self.ctx.send(:extend, target)
      end

      def method_missing(meth, *args, &blk)
        m = ctx.method(meth)
        # bind all args:
        if args.size == m.arity
          ->(*) { m.to_proc[*args] }
        else
          m.to_proc.curry(m.arity)[*args]
        end
      end
    end
  end
end
