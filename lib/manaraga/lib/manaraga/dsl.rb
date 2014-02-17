module Manaraga
  module DSL
    autoload :Base,  'manaraga/dsl/base'
    autoload :Index, 'manaraga/dsl/index'
    autoload :Show,  'manaraga/dsl/show'
    autoload :Form,  'manaraga/dsl/form'

    def self.included(base)
      base.send :include, Manaraga::InheritedResources
      base.extend ClassMethods

      base.class_eval do
        class_attribute :manaraga_configuration
        self.manaraga_configuration = Manaraga.configuration.dup
      end
    end

    module ClassMethods
      def manaraga(&block)
        index
        show
        form

        self.class_eval(&block) if block_given?
      end

      # Example:
      #
      # index do
      #   column :name
      #   column :price
      #   column :description
      #   column :created_at
      #   column :company
      # end
      def index(*args, &block)
        self.manaraga_configuration.index_columns = Manaraga::DSL::Index.new(
          resource_class,
          self.manaraga_configuration,
          args.extract_options!,
          &block
        ).columns
      end

      def show(*args, &block)
        self.manaraga_configuration.show_columns = Manaraga::DSL::Show.new(
          resource_class,
          self.manaraga_configuration,
          args.extract_options!,
          &block
        ).columns
      end

      def form(*args, &block)
        self.manaraga_configuration.form_columns = Manaraga::DSL::Form.new(
          resource_class,
          self.manaraga_configuration,
          args.extract_options!,
          &block
        ).columns
      end
    end
  end
end
