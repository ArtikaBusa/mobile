ActiveAdmin.register ProductCategory do
  permit_params :product_id, :category_id

  index do
    selectable_column
    id_column
    column :product_id
    column :category_id
    actions
  end

  filter :product_id
  filter :category_id

  form do |f|
    f.inputs do
      f.input :product_id
      f.input :category_id
    end
    f.actions
  end
end
