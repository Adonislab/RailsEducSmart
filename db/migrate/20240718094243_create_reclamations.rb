class CreateReclamations < ActiveRecord::Migration[7.2]
  def change
    create_table :reclamations do |t|
      t.string :object
      t.text :description
      t.string :nom

      t.timestamps
    end
  end
end
