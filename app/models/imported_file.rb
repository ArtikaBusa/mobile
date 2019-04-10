class ImportedFile < ApplicationRecord
  after_create :file_processing

  def file_processing
    ImportedFileJob.perform_later id
  end
end
