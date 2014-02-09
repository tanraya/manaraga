module Manaraga
  module Decorator
    module Attributes
      # Нужны разные атрибуты для разных экшенов, index_attributes, show_attributes
      # form_attributes
      # А так же form_columns, index_columns и тп
      def attributes_for(name)
        #raise convert_to_attributes(configuration.index_columns).inspect
        if configuration.foreign_key_as_association
          {
            index: convert_to_attributes(configuration.index_columns),
            show:  convert_to_attributes(configuration.show_columns),
            form:  convert_to_attributes(configuration.form_columns),
          }.fetch(name.to_sym)
        else
          {
            index: configuration.index_columns,
            show:  configuration.show_columns,
            form:  configuration.form_columns,
          }.fetch(name.to_sym)
        end
      end

      def association?(name) # Column name or attribute
        column_name_for(name) != name.to_sym || resource_foreign_keys.include?(name.to_s)
      end

      protected

      def convert_to_attributes(column_names)
        column_names.map do |column_name|
          if association?(column_name)
            attribute_name_for(column_name)
          else
            column_name
          end
        end
      end

      # Find attribute (association) name for column name
      def attribute_name_for(column_name)
        if found = (resource_belongs_to_associations.find { |a| a.foreign_key == column_name.to_s })
          found.name.to_sym
        else
          column_name
        end
      end

      def column_name_for(attribute)
        if found = (resource_belongs_to_associations.find { |a| a.name == attribute.to_sym })
          found.foreign_key.inspect
        else
          attribute
        end
      end

      def resource_associations
        @associations ||= resource_class.reflect_on_all_associations
      end

      def resource_belongs_to_associations
        resource_associations.select { |a| a.macro == :belongs_to }
      end

      def resource_foreign_keys
        @foreign_keys ||= resource_belongs_to_associations.map(&:foreign_key)
      end
    end
  end
end
