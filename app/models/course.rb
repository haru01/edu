class Course < ActiveRecord::Base
  has_one :main_assign, class_name: 'Assign', readonly: true, conditions: {role: Assign::ROLE_MAIN}
  has_one :main_lecturer, :through => :main_assign, :source => :lecturer

  has_many :assigns, :dependent => :destroy, :readonly => true
  has_many :lecturers, :through => :assigns, :readonly => true
end
