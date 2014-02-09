require 'ostruct'

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
        self.manaraga_configuration = Manaraga::Configuration.new
      end
    end

    module ClassMethods
      def manaraga(&block)
        self.class_eval(&block) if block_given?
        index
        show
        form
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
        index_dsl = Manaraga::DSL::Index.new(resource_class, self.manaraga_configuration, args.extract_options!, &block)
        self.manaraga_configuration.index_columns = index_dsl.columns
      end

      def show(*args, &block)
        show_dsl = Manaraga::DSL::Show.new(resource_class, self.manaraga_configuration, args.extract_options!, &block)
        self.manaraga_configuration.show_columns = show_dsl.columns
      end

      def form(*args, &block)
        form_dsl = Manaraga::DSL::Form.new(resource_class, self.manaraga_configuration, args.extract_options!, &block)
        self.manaraga_configuration.form_columns = form_dsl.columns
      end
    end
  end
end
