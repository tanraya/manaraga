# Keeps configuration defined by DSL
=begin
index
  columns
  display_heading
  display_new_button
  display_pagination
  table_classes

formatters
  float
  string
  association
  datetime
  array
  integer
  boolean
  empty # nil or empty

decorate_collection_for [:index]
decorate_resource_for [:destroy, :create, :update]
=end
module Manaraga
  class Configuration
    attr_reader :config

    def initialize
      @config = OpenStruct.new(
        decorator_class: Manaraga::Decorator::DefaultDecorator,
        index_decorator_class: Manaraga::Decorator::IndexDecorator,
        decorate_resource_for: [:destroy, :create, :update],

        # Automatically translate foreign keys columns to associations
        foreign_key_as_association: true
      )
    end

    def method_missing(m, *args, &block)
      config.send(m, *args, &block)
    end
  end
end
