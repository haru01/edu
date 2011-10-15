# encoding: utf-8
class Assign < ActiveRecord::Base
  class Role < ActiveEnum::Base
    order :asc

    value id: 1, name: '主'
    value id: 2, name: '副'
  end
  enumerate :role, with: Role
end
