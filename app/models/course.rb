# encoding: utf-8
class Course < ActiveRecord::Base
  has_one :main_assign, class_name: 'Assign', readonly: true, conditions: {role: Assign::Role["主"]}
  has_one :main_lecturer, :through => :main_assign, :source => :lecturer

  has_many :assigns, :dependent => :destroy, :readonly => true
  has_many :lecturers, :through => :assigns, :readonly => true

  class Status < ActiveEnum::Base
    value id: 1, name: '予定'
    value id: 2, name: '確定'
    value id: 3, name: '中止'
    value id: 4, name: '完了'
  end
  enumerate :status, with: Status
end
