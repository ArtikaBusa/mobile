class CreateSellerProductVariants < ActiveRecord::Migration[5.2]
  def change
    create_table :seller_product_variants do |t|
      t.belongs_to :seller, index: true
      t.belongs_to :product_variant, index: true
      t.decimal :price
      t.decimal :discount
      t.decimal :final_price

      t.timestamps
    end
  end
end
