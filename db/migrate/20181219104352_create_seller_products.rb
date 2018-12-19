class CreateSellerProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :seller_products do |t|
      t.belongs_to :seller, index: true
      t.belongs_to :product, index: true

      t.timestamps
    end
  end
end
