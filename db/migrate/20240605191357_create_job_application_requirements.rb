class CreateJobApplicationRequirements < ActiveRecord::Migration[7.1]
  def change
    create_table :job_application_requirements do |t|
      t.references :job_application, index: true, foreign_key: true
      t.references :position_criterium, index: true, foreign_key: true
      t.boolean :satisfied, default: false
      t.timestamps
    end
  end
end
