class CreatePositionCriteria < ActiveRecord::Migration[7.1]
  def change
    create_table :position_criteria do |t|
      t.references :position, index: true, foreign_key: true
      t.string :criteria_value
      t.boolean :required, default: true
      t.timestamps
    end
  end
end
