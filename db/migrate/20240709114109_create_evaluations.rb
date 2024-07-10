class CreateEvaluations < ActiveRecord::Migration[7.2]
  def change
    create_table :evaluations do |t|
      t.integer :course_id
      t.integer :user_id
      t.integer :score
      t.text :feedback
      t.timestamps
    end
  end
end
