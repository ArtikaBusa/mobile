class CreateImportedFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :imported_files do |t|
      t.string :description
      t.boolean :available
      t.string :release_year
      t.integer :brand_id
      t.integer :no_of_success_record
      t.integer :no_of_failure_record
      t.string :error

      t.timestamps
    end
  end
end
