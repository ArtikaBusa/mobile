ActiveAdmin.register User do
  permit_params :name, :email, :contact_no, :address, :password, :password_confirmation, :profile_photo, :role_id

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :contact_no
    column :address
    column :password
    column :password_confirmation
    column :profile_photo
    column :role
    actions
  end

  filter :name
  filter :email
  filter :contact_no
  filter :address
  filter :password
  filter :password_confirmation
  filter :profile_photo
  filter :role
  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :contact_no
      f.input :address
      f.input :password
      f.input :password_confirmation
      f.input :profile_photo, as: :file
      f.input :role
    end
    f.actions
  end
end
