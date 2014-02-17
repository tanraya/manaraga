module Manaraga
  module DSL
    class Form < Base
      def columns(arg = nil)
        super(arg) - [:id, :created_at, :updated_at]
      end
    end
  end
end
