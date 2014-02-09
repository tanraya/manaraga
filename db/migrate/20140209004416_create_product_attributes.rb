class CreateProductAttributes < ActiveRecord::Migration
  def change
    create_table :product_attributes do |t|
      t.string :name, null: false
      t.string :value, null: false
      t.references :product, index: true, null: false

      t.timestamps
    end
  end
end
