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
        ctx.method(meth).to_proc.curry[*args]
      end
    end
  end
end
