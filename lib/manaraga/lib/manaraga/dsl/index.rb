module Manaraga
  module DSL
    class Index < Base
      def columns
        @cached_columns ||= ([:id] + @columns.map(&:to_sym)).uniq
      end

      def sort(options)

      end

      def paginate(options)

      end

      # TODO: Doesnt work yet
      def foreign_key_as_association(enabled)
        configuration.foreign_key_as_association = enabled
      end

      def decorator_class(klass)
        configuration.decorator_class = klass
      end
    end
  end
end
