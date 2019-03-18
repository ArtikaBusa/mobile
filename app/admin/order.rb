ActiveAdmin.register Order do
  permit_params :user_id, :seller_id, :seller_product_variant_id, :product_variant_id, :price, :discount, :final_price, :address, :city, :state, :pincode, :payment_type, :payment_transaction, :ordered_date, :shipping_date, :cancle_date

  index do
    selectable_column
    id_column
    column :user_id
    column :seller_id
    column :seller_product_variant_id
    column :product_variant_id
    column :price
    column :discount
    column :final_price
    column :address
    column :city
    column :state
    column :pincode
    column :payment_type
    column :payment_transaction
    column :ordered_date
    column :shipping_date
    column :cancle_date
    actions
  end

  filter :user_id
  filter :seller_id
  filter :seller_product_variant_id
  filter :product_variant_id
  filter :price
  filter :discount
  filter :final_price
  filter :address
  filter :city
  filter :state
  filter :pincode
  filter :payment_type
  filter :payment_transaction
  filter :ordered_date
  filter :shipping_date
  filter :cancle_date

  form do |f|
    f.inputs do
      f.input :user_id
      f.input :seller_id
      f.input :seller_product_variant_id
      f.input :product_variant_id
      f.input :price
      f.input :discount
      f.input :final_price
      f.input :address
      f.input :city
      f.input :state
      f.input :pincode
      f.input :payment_type
      f.input :payment_transaction
      f.input :ordered_date
      f.input :shipping_date
      f.input :cancle_date
    end
    f.actions
  end
end
