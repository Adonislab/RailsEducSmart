class AddReferencesToEvaluations < ActiveRecord::Migration[7.2]
  def change
    add_reference :evaluations, :users, null: false, foreign_key: true
    add_reference :evaluations, :courses, null: false, foreign_key: true
  end
end
