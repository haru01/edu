# encoding: utf-8

require 'spec_helper'

describe Assign::Role do

  it "Assign::Roleの使い方" do
    Assign::Role[1].should == "主"
    Assign::Role["副"].should == 2
  end

  it "Assign::Role.to_select の使い方の学習テスト" do
    Assign::Role.to_select.should == [["主", 1], ["副", 2]]
    Assign::Role.to_select.map(&:first).should == ["主", "副"]
  end

  let(:assign) {
    assign = Assign.new
    assign.role = Assign::Role["副"]
    assign
  }

  it "assign.role の使い方の学習テスト" do
    assign.role.should == 2
    assign.role(:id) == 2
    assign.role(:name) == "副"
    assign.role(:enum) == Assign::Role
  end

  it "assign.role?("..") の使い方の学習テスト" do
    assign.should_not be_role("主")
    assign.should be_role("副")
  end
end
