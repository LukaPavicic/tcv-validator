class CreatePositions < ActiveRecord::Migration[7.1]
  def change
    create_table :positions do |t|
      t.string :name
      t.string :description
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
