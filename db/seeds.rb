Product.destroy_all
Company.destroy_all

company = Company.create!(name: 'Awesome Inc', city: 'Yekaterinburg')

1.upto(50) do |i|
  Product.create! do |x|
    x.name = "Product item #{i}"
    x.price = 2500.0
    x.description = 'xxx ' * 30
    x.company = company
  end
end
