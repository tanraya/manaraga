require 'ostruct'

module Manaraga
  module DSL
    autoload :Base,  'manaraga/dsl/base'
    autoload :Index, 'manaraga/dsl/index'
    autoload :Show,  'manaraga/dsl/show'
    autoload :Form,  'manaraga/dsl/form'

    def self.included(base)
      base.extend ClassMethods
      base.class_eval do
        class_attribute :manaraga

        self.manaraga = OpenStruct.new
        self.manaraga.configuration = Manaraga::Configuration.new

        index
        show
        form
      end
    end

    module ClassMethods
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
        index_dsl = Manaraga::DSL::Index.new(resource_class, args.extract_options!, &block)
        self.manaraga.configuration.index_columns = index_dsl.columns
      end

      def show(*args, &block)
        show_dsl = Manaraga::DSL::Show.new(resource_class, args.extract_options!, &block)
        self.manaraga.configuration.show_columns = show_dsl.columns
      end

      def form(*args, &block)
        form_dsl = Manaraga::DSL::Form.new(resource_class, args.extract_options!, &block)
        self.manaraga.configuration.form_columns = form_dsl.columns
      end
    end
  end
end
