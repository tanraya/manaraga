class ProductDecorator < Draper::Decorator
  include Manaraga::Decorator::Decoratable

  def price
    h.content_tag :strong, object.price
  end
end
