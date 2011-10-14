class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.date :start
      t.date :end
      t.integer :status
      t.integer :number
      t.string :location

      t.timestamps
    end
  end
end
