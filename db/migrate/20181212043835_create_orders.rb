class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.belongs_to :user, index: true
      t.belongs_to :seller, index: true
      t.belongs_to :seller_product_variant, index: true
      t.belongs_to :product_variant, index: true
      t.decimal :price
      t.decimal :discount
      t.decimal :final_price
      t.string :address, limit: 500
      t.string :city, limit: 100
      t.string :state, limit: 100
      t.string :pincode, limit: 6
      t.timestamp :ordered_date
      t.timestamp :shipping_date
      t.timestamp :cancle_date

      t.timestamps
    end
  end
end
