# encoding: utf-8
World(Rack::Test::Methods)

Given /^講師マスタが登録されている$/ do
  Fabricate(:lecturer, name: "天野")
  Fabricate(:lecturer, name: "懸田")
  Fabricate(:lecturer, name: "児玉")
  Fabricate(:lecturer, name: "家永")
end

Given /^カリキュラムマスタが登録されている$/ do
  Fabricate(:curriculum, name: "TDD入門", description: "TDDをハンズオンで学ぶ", days: 3)
  Fabricate(:curriculum, name: "UML入門", description: "UMLをハンズオンで学ぶ", days: 2)
  Fabricate(:curriculum, name: "リファクタリング入門", description: "リファクタリングをハンズオンで学ぶ", days: 1)
end

Given /^顧客マスタが登録されている$/ do
  Fabricate(:customer, name: "企業A")
  Fabricate(:customer, name: "企業B")
end

Given /^授業が登録されている$/ do |table|
  table.hashes.each do | params |
    course = Fabricate(:course,
              from_date: params["開催日（開始）"],
              to_date: params["開催日（終了）"],
              location: params["場所"],
              number: params["人数"].to_i,
              curriculum_id: Curriculum.find_by_name(params["カリキュラム名称"]))
    lecturer = Lecturer.find_by_name(params["講師(主)"])
    @assign = Fabricate(:assign, course_id: course.id,
                       lecturer_id: lecturer.id)
  end
end


When /^授業登録APIが呼ばれた$/ do |table|
  params = table.hashes[0]
  post courses_path, { from_date: params["開催日（開始）"],
                           to_date: params["開催日（終了）"],
                           location: params["場所"],
                           number: params["人数"],
                           curriculum_id: params["カリキュラムID"],
                           customer_id: params["顧客ID"],
                           main_lecturer_id: params["主講師ID"],}.to_json
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
  # puts actual
  actual["main_lecturer"]["name"].should == exptect["講師(主)"]
  actual["curriculum"]["name"].should == exptect["カリキュラム名称"]
  # TODO 講師（副）の情報取得
  # TODO カリキュラムの名前、概要の情報取得
  actual["from_date"].should == exptect["開催日（開始）"]
  actual["to_date"].should == exptect["開催日（終了）"]
  actual["location"].should == exptect["場所"]
  actual["number"].should == exptect["人数"].to_i
  Course::Status[actual["status"]].should == exptect["ステータス"]
end



