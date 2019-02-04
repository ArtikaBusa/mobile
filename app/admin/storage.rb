ActiveAdmin.register Storage do
  permit_params :name, :ram

  index do
    selectable_column
    id_column
    column :name
    column :ram
    actions
  end

  filter :name
  filter :ram

  form do |f|
    f.inputs do
      f.input :name
      f.input :ram
    end
    f.actions
  end
end
