# encoding: utf-8
require 'spec_helper'

describe Lecturer do
  it "#save" do
    Lecturer.create(name: "ienaga")
    Lecturer.count.should == 1
  end
end
