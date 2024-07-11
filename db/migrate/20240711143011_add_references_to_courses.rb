class AddReferencesToCourses < ActiveRecord::Migration[7.2]
  def change
    add_reference :courses, :users, null: false, foreign_key: true
    add_reference :courses, :categories, null: false, foreign_key: true
  end
end
