# encoding: utf-8
require 'fabrication'
require 'fabrication/cucumber'

World(Rack::Test::Methods)

前提 /^授業が登録されている$/ do |table|
  table.hashes.each do | hash |
    Fabricate(:course,
      from_date: Date.strptime(hash[:from_date], "%Y-%m-%d"))
  end
end

前提 /^授業の一覧取得APIにアクセスしている$/ do
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'
  get courses_path
end

ならば /^登録された授業の一覧が開始順に取得できること:$/ do |table|
  page = JSON.parse(last_response.body)
  acutal = page.map { |node| node["from_date"] }
  exptect = table.hashes.map { | hash | hash[:from_date] }

  acutal.should == exptect
end
