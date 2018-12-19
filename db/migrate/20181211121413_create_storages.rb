class CreateStorages < ActiveRecord::Migration[5.2]
  def change
    create_table :storages do |t|
      t.string :name, limit: 30
      t.boolean :ram

      t.timestamps
    end
  end
end
