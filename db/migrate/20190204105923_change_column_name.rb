class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :product_variants, :processore_id, :processor_id
  end
end
