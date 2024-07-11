class AddReferencesToCategories < ActiveRecord::Migration[7.2]
  def change
    add_reference :categories, :course_details, null: false, foreign_key: true
  end
end
