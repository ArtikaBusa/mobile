class AddFileNameToImportedFile < ActiveRecord::Migration[5.2]
  def change
    add_column :imported_files, :file_name, :string
  end
end
