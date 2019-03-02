class CreateSellerProductVariants < ActiveRecord::Migration[5.2]
  def change
    create_table :seller_product_variants do |t|
      t.decimal :price
      t.decimal :discount
      t.decimal :final_price
      t.belongs_to :seller_product, foreign_key: true
      t.belongs_to :product_variant, foreign_key: true

      t.timestamps
    end
  end
end
