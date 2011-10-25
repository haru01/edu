# encoding: utf-8
require 'spec_helper'

shared_context "１件授業が登録されている" do
  let!(:assign) do
    Fabricate(:assign) do
      course!
      lecturer!
    end
  end

  let!(:course) do
    assign.course
  end

  let!(:lecturer) do
    assign.lecturer
  end
end

describe Course do
  include_context "１件授業が登録されている"

  it "講師(主)が取得できること" do
    course.main_lecturer.name.should == lecturer.name
  end
end
