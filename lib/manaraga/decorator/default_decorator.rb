# This decorator used in views except index view
module Manaraga
  module Decorator
    class DefaultDecorator < ::Draper::Decorator
      include Decoratable
    end
  end
end
