class CreateCurriculums < ActiveRecord::Migration
  def change
    create_table :curriculums do |t|
      t.string :name
      t.string :description
      t.integer :days

      t.timestamps
    end
  end
end
