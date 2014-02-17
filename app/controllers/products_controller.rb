class ProductsController < ApplicationController
  include Manaraga::DSL

  manaraga do
    index do
      columns except: %w(price)
      foreign_key_as_association true
    end

    show do
      columns except: %w(name price description)
    end

    form do
      #columns except: %w(name price description)
      columns %w(name price description)
    end
  end

  def by_rubric
    @products = collection_without_decorator.where('id < 15').limit(10)
    render 'index'
  end

  # TODO: Build it automatically (we know form columns)
  def build_resource_params
    [params.fetch(:product, {}).permit(:name, :price, :description, :company_id)]
  end
end
