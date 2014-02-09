# This decorator only used for index view
module Manaraga
  module Decorator
    class IndexDecorator < ::Draper::Decorator
      include Decoratable

      def method_missing(m, *args, &block)
        if object.respond_to?(m)
          h.content_tag :td, class: cell_html_class(m) do
            attribute_format(m)
          end
        else
          super
        end
      end

      protected

      def cell_html_class(attribute)
        "#{object.class.name.downcase.underscore}_#{attribute}"
      end
    end
  end
end
