class CreateProductVariants < ActiveRecord::Migration[5.2]
  def change
    create_table :product_variants do |t|
      t.belongs_to :product, index: true
      t.belongs_to :storage, index: true
      t.belongs_to :color, index: true
      t.belongs_to :display, index: true
      t.belongs_to :processore, index: true
      t.decimal :price
      t.integer :width, limit: 5
      t.integer :height, limit: 5
      t.integer :thickness, limit: 5
      t.integer :weight, limit: 5
      t.integer :front_camera, limit: 10
      t.integer :rear_camera, limit: 10

      t.timestamps
    end
  end
end
