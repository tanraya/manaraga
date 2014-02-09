class ProductsController < ApplicationController
  include Manaraga::DSL

  manaraga do
    # Here we able to change InheritedResources behavior
    #defaults resource_class:  Product::Property,
    #   collection_name: 'product_properties',
    #   instance_name:   'product_property'

    index do
      #sort except:  %w(description company),
      #     order:   :asc,
      #     default: :id

      #paginate per: 20
      #paginate false

      foreign_key_as_association true
      decorator_class ProductDecorator

      column :name
      column :price
      column :description
      column :created_at
      column :company
      #columns except: %w(price)
      #columns only: %w(price)
      #columns %w(name price)
    end

    show do
      column :name
      column :price
      column :description
    end

    form do
      column :name
      column :price
      column :description
    end
  end

=begin

=end


  def by_rubric
    @products = collection_without_decorator.where('id < 15').limit(10)
    render 'index'
  end

  # TODO: Build it automatically (we know form columns)
  def build_resource_params
    [params.fetch(:product, {}).permit(:name, :price, :description, :company_id)]
  end
end
