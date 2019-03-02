ActiveAdmin.register SellerProduct do
  permit_params :seller_id, :product_id

  index do
    selectable_column
    id_column
    column :seller_id
    column :product_id
    actions
  end

  filter :seller_id
  filter :product_id

  form do |f|
    f.inputs do
      f.input :seller_id
      f.input :product_id
    end
    f.actions
  end
end
