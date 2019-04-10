class ImportedFileJob < ActiveJob::Base
  queue_as :default

  def perform(file_id)
    @imported_file = ImportedFile.find_by(id: file_id)
    file = "#{Rails.root}/public/files/#{file_id}/#{@imported_file.file_name}"
    success = 0
    failed = 0
    CSV.foreach(file, headers: true) do |row|
      product = Product.new row.to_hash
      if product.save
        success += 1
      else
        failed += 1
      end
    end

    @imported_file.update(no_of_success_record: success, no_of_failure_record: failed)
  end
end
