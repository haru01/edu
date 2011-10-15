# encoding: utf-8
World(Rack::Test::Methods)

Given /^講師マスタが登録されている$/ do
  Fabricate(:lecturer, name: "天野")
  Fabricate(:lecturer, name: "懸田")
  Fabricate(:lecturer, name: "児玉")
  Fabricate(:lecturer, name: "家永")
end

Given /^授業が登録されている$/ do |table|
  table.hashes.each do | hash |
    course = Fabricate(:course,
              from_date: Date.strptime(hash["開催日"], "%Y-%m-%d"),
              location: hash["場所"],
              number: hash["人数"].to_i)
    lecturer = Lecturer.find_by_name(hash["講師(主)"])
    Fabricate(:assign, course_id: course.id,
                       lecturer_id: lecturer.id)
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
  actual["main_lecturer"]["name"].should == exptect["講師(主)"]
end
