ActiveAdmin.register ImportedFile do
  permit_params :file_name, :no_of_success_record, :no_of_failure_record, :error

  index do
    selectable_column
    id_column
    column :file_name
    column :no_of_success_record
    column :no_of_failure_record
    column :error
    actions
  end

  form do |f|
    f.inputs do
      f.input :file_name, as: :file
    end
    f.actions
  end

  controller do
    def create
      uploaded_io = params[:imported_file][:file_name]
      @imported_file = ImportedFile.new(file_name: uploaded_io.original_filename)
      if @imported_file.save
        dir = Rails.root.join('public', 'files', @imported_file.id.to_s)
        Dir.mkdir(dir) unless Dir.exist?(dir)
        File.open(dir.join(uploaded_io.original_filename), 'wb') do |file|
          file.write(uploaded_io.read)
        end
        redirect_to admin_imported_file_path(@imported_file)
      end
    end
  end
end
