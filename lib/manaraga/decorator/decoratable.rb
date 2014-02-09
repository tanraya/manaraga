module Manaraga
  module Decorator
    module Decoratable
      include AttributeFormatter
      include Attributes

      def method_missing(m, *args, &block)
        if object.respond_to?(m)
          attribute_format(m)
        else
          super
        end
      end

      protected

      def configuration
        h.controller.manaraga.configuration
      end

      def resource_class
        object.class
      end
    end
  end
end
