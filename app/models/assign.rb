# encoding: utf-8
class Assign < ActiveRecord::Base
  belongs_to :lecturer
  belongs_to :course

  ROLE_MAIN = 1
  ROLE_SUB = 2
  class Role < ActiveEnum::Base
    order :asc

    value id: ROLE_MAIN, name: '主'
    value id: ROLE_SUB, name: '副'
  end
  enumerate :role, with: Role
end
