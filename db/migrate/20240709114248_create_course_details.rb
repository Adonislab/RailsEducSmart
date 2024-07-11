class CreateCourseDetails < ActiveRecord::Migration[7.2]
  def change
    create_table :course_details do |t|
      t.string :content
      t.string :video
      t.string :audio
      t.timestamps
    end
  end
end
