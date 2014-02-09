class Product::Property < ActiveRecord::Base
  belongs_to :product

  def self.table_name
    'product_attributes'
  end

  #def self.model_name
  #  ActiveModel::Name.new(self, Product)
  #end
end
