module Manaraga
  module InheritedResources
    def self.included(base)
      base.class_eval do
        inherit_resources
        has_scope :page, default: 1

        alias_method :collection_without_decorator, :collection
        alias_method :collection,                   :collection_with_decorator
        alias_method :resource_without_decorator,   :resource
        alias_method :resource,                     :resource_with_decorator
      end
    end

    def collection_with_decorator
      collection = collection_without_decorator

      # Automatically includes associations
      if self.manaraga_configuration.foreign_key_as_association
        collection = include_associations_for(collection)
      end

      Manaraga::Decorator::CollectionDecorator.decorate(collection)
    end

    def resource_with_decorator
      if self.manaraga_configuration.decorate_resource_for.include?(action_name.to_sym)
        resource_without_decorator
      else
        self.manaraga_configuration.decorator_class.decorate(resource_without_decorator)
      end
    end

    private

    def include_associations_for(collection)
      associations = resource_class.reflect_on_all_associations
                                   .select { |a| a.macro == :belongs_to }
                                   .map(&:name)

      if associations.any?
        collection = collection.includes(*associations)
      end

      collection
    end
  end
end
