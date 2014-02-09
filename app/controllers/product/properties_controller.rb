class Product::PropertiesController < ApplicationController

  include Manaraga::InheritedResources

  defaults resource_class:  Product::Property,
           collection_name: 'properties',
           instance_name:   'property',
           route_prefix:    ''

  belongs_to :product

  include Manaraga::DSL

  #def build_resource_params
  #  [params.fetch(:product_property, {}).permit(:name, :value, :product_id)]
  #end
=begin
  def index
    @product = Product.find(params[:product_id])
    @properties = @product.properties.all

    raise polymorphic_path([@product, @properties.first])
  end
=end
end
