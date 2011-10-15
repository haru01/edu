class CreateAssigns < ActiveRecord::Migration
  def change
    create_table :assigns do |t|
      t.integer :course_id
      t.integer :lecturer_id
      t.integer  :role
      t.timestamps
    end
  end
end
