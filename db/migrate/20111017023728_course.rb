class Course < ActiveRecord::Migration
  def change
    add_column :courses, :curriculum_id, :integer
    add_column :courses, :customer_id, :integer
  end
end
