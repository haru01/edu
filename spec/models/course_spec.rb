# encoding: utf-8
require 'spec_helper'

shared_context "１件授業が登録されている" do
  let!(:course) { Fabricate(:course) }
  let!(:lecturer) { Fabricate(:lecturer) }
  let!(:assign) { Fabricate(:assign) }
end

describe Course do
  include_context "１件授業が登録されている"
  it "講師(主)が取得できること" do
    course.main_lecturer.name.should == lecturer.name
  end
end
