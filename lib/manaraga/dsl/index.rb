module Manaraga
  module DSL
    class Index < Base
      def columns
        @cached_columns ||= (@columns.map(&:to_sym) + [:id]).uniq
      end
    end
  end
end
