class CreatePlannings < ActiveRecord::Migration[7.2]
  def change
    create_table :plannings do |t|
      t.integer :course_id
      t.datetime :start_time
      t.datetime :end_time
      t.timestamps
    end
  end
end
