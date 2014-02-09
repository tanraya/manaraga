module Manaraga
  module Decorator
    class CollectionDecorator < ::Draper::CollectionDecorator
      include Attributes

      # Delegate methods to support Kaminari pagination
      delegate :current_page, :total_pages, :limit_value

      def decorator_class
        Manaraga::Decorator::IndexDecorator
      end

      def resource_class
        object.klass
      end

      def configuration
        h.controller.manaraga.configuration
      end

      def table_html_classes
        "#{collection_name} manaraga table table-striped table-bordered table-hover table-condensed table-responsive"
      end

      def collection_name
        object.table.name
      end
    end
  end
end
