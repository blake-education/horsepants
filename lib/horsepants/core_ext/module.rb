module Horsepants
  module ModuleExt
    include Horsepants::Lambdaize

    def ns(spec)
      spec.each do |name, to|
        module_eval <<-EOF
          def self.#{name}
            #{to}
          end
          def #{name}
            #{to}
          end
        EOF
      end
    end
  end
end
