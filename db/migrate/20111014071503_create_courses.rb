class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.date :from_date
      t.date :to_date
      t.integer :status
      t.integer :number
      t.string :location

      t.timestamps
    end
  end
end
