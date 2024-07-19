class CreateAppreciations < ActiveRecord::Migration[7.2]
  def change
    create_table :appreciations do |t|
      t.integer :notes
      t.string :appreciation
      t.string :nom

      t.timestamps
    end
  end
end
