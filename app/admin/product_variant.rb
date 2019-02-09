ActiveAdmin.register ProductVariant do
  permit_params :product_id, :storage_id, :color_id, :display_id, :processor_id,
                :price, :width, :height, :thickness, :weight, :front_camera, :rear_camera

  index do
    selectable_column
    id_column
    column :product_id
    column :storage_id
    column :color_id
    column :display_id
    column :processor_id
    column :price
    column :width
    column :height
    column :thickness
    column :weight
    column :front_camera
    column :rear_camera
    actions
  end

  filter :product_id
  filter :storage_id
  filter :color_id
  filter :display_id
  filter :processor_id
  filter :price
  filter :width
  filter :height
  filter :thickness
  filter :weight
  filter :front_camera
  filter :rear_camera

  form do |f|
    f.inputs do
      f.input :product_id
      f.input :storage_id
      f.input :color_id
      f.input :display_id
      f.input :processor_id
      f.input :price
      f.input :width
      f.input :height
      f.input :thickness
      f.input :weight
      f.input :front_camera
      f.input :rear_camera
    end
    f.actions
  end
end
