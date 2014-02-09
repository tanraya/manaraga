class Product < ActiveRecord::Base
  belongs_to :company
  has_many :properties, class_name: Product::Property

  def to_s
    name
  end
end
