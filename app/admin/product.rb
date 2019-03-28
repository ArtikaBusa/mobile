ActiveAdmin.register Product do
  permit_params :description, :available, :release_year, :brand_id, mobile_photos: []

  index do
    selectable_column
    id_column
    column :description
    column :available
    column :release_year
    column :brand_id
    column :mobile_photos
    actions
  end

  filter :description
  filter :available
  filter :release_year
  filter :brand_id
  filter :mobile_photos

  form do |f|
    f.inputs do
      f.input :description
      f.input :available
      f.input :release_year
      f.input :brand_id
      f.input :mobile_photos, as: :file, input_html: { multiple: true }
    end
    f.actions
  end
end
