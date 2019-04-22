class CreateProductVariants < ActiveRecord::Migration[5.2]
  def change
    create_table :product_variants do |t|
      t.belongs_to :product, index: true
      t.belongs_to :storage, index: true
      t.belongs_to :color, index: true
      t.belongs_to :display, index: true
      t.belongs_to :processore, index: true
      t.decimal :price
      t.integer :width
      t.integer :height
      t.integer :thickness
      t.integer :weight
      t.integer :front_camera
      t.integer :rear_camera

      t.timestamps
    end
  end
end
