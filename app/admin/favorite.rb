ActiveAdmin.register Wishlist do
  permit_params :user_id, :product_id

  index do
    selectable_column
    id_column
    column :user_id
    column :product_id
    actions
  end

  filter :user_id
  filter :product_id

  form do |f|
    f.inputs do
      f.input :user_id
      f.input :product_id
    end
    f.actions
  end
end
