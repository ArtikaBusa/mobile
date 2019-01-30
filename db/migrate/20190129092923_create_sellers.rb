class CreateSellers < ActiveRecord::Migration[5.2]
  def change
    create_table :sellers do |t|
      t.string :name
      t.string :email
      t.string :address, limit: 500
      t.string :contact_no, limit: 15

      t.timestamps
    end
  end
end
