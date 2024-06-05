class CreateJobApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :job_applications do |t|
      t.string :applicant_full_name
      t.string :applicant_address
      t.string :applicant_phone_number
      t.string :applicant_oib
      t.references :position, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :status, default: 0
      t.text :cv_text
      t.timestamps
    end
  end
end
