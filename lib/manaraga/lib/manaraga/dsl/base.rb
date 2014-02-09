module Manaraga
  module DSL
    class Base
      attr_reader :resource_class, :configuration, :options

      def initialize(resource_class, configuration, options, &block)
        @resource_class = resource_class
        @configuration = configuration
        @options = options

        if block_given?
          @columns = []
          instance_eval(&block)
        else
          @columns = resource_class.column_names
        end
      end

      def column(attribute, &block)
        @columns << attribute
      end

      def columns
        @cached_columns ||= @columns.map(&:to_sym).uniq
      end
    end
  end
end
