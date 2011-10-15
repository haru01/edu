# encoding: utf-8
require 'fabrication'
require 'fabrication/cucumber'

World(Rack::Test::Methods)

Given /^授業が登録されている$/ do |table|
  table.hashes.each do | hash |
    Fabricate(:course,
      from_date: Date.strptime(hash["開催日"], "%Y-%m-%d"),
      location: hash["場所"],
      number: hash["人数"].to_i)
  end
end

When /^授業の一覧取得APIにアクセスしている$/ do
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'
  get courses_path
end

Then /^登録された授業の一覧が開催日順に取得できること:$/ do |table|
  page = JSON.parse(last_response.body)
  acutal = page.map { |node| node["from_date"] }
  exptect = table.hashes.map { | hash | hash["開催日"] }

  acutal.should == exptect
end

Then /^授業情報が取得できていること$/ do |table|
  actual = JSON.parse(last_response.body)[0]
  exptect = table.hashes[0]

  actual["from_date"].should == exptect["開催日"]
  actual["location"].should == exptect["場所"]
  actual["number"].should == exptect["人数"].to_i
end
