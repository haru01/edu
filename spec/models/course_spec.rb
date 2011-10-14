require 'spec_helper'

describe Course do
  before {}

  it "does something" do
    Fabricate(:course)
    Course.count.should == 1
  end
end
