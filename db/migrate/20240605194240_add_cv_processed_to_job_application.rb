class AddCvProcessedToJobApplication < ActiveRecord::Migration[7.1]
  def change
    add_column :job_applications, :cv_processed_at, :datetime
  end
end
