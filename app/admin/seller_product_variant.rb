ActiveAdmin.register SellerProductVariant do
  permit_params :seller_product_id, :product_variant_id, :price, :discount, :final_price

  index do
    selectable_column
    id_column
    column :seller_product_id
    column :product_variant_id
    column :price
    column :discount
    column :final_price
    actions
  end

  filter :seller_product_id
  filter :product_variant_id
  filter :price
  filter :discount
  filter :final_price

  form do |f|
    f.inputs do
      f.input :seller_product_id
      f.input :product_variant_id
      f.input :price
      f.input :discount
      f.input :final_price
    end
    f.actions
  end
end
