ActiveAdmin.register Product do
  permit_params :description, :available, :release_year, :brand_id

  index do
    selectable_column
    id_column
    column :description
    column :available
    column :release_year
    column :brand_id
    actions
  end

  filter :description
  filter :available
  filter :release_year
  filter :brand_id

  form do |f|
    f.inputs do
      f.input :description
      f.input :available
      f.input :release_year
      f.input :brand_id
    end
    f.actions
  end
end
