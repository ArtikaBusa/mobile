class RemoveDescriptionFromImportedFiles < ActiveRecord::Migration[5.2]
  def change
    remove_column :imported_files, :description, :string
    remove_column :imported_files, :available, :string
    remove_column :imported_files, :release_year, :string
    remove_column :imported_files, :brand_id, :string
    
  end
end
