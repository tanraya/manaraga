module Manaraga
  module DSL
    class Form < Base
      def columns
        @cached_columns ||= @columns.map(&:to_sym).uniq - [:id, :created_at, :updated_at]
      end
    end
  end
end
