module Manaraga
  module DSL
    class Base
      attr_reader :resource_class, :configuration, :options

      def initialize(resource_class, configuration, options, &block)
        @resource_class = resource_class
        @configuration  = configuration
        @options        = options

        if block_given?
          @columns = []
          instance_eval(&block)
        else
          @columns = resource_class.column_names
        end
      end

      # Define columns to show in table
      def columns(arg = nil)
        case arg
        when Array # Columns passed
          @columns = resource_class.column_names.map(&:to_sym).uniq
        when Hash  # Only options passed
          @columns = resource_class.column_names

          if arg.has_key?(:except)
            @columns = (@columns - arg.fetch(:except).map(&:to_s)).map(&:to_sym).uniq
          end
        else
          @columns
        end
      end
    end
  end
end
