# encoding: utf-8
World(Rack::Test::Methods)

前提 /^授業が登録されている$/ do
  Course.create(number: 10)
end

前提 /^授業の一覧取得APIにアクセスしている$/ do
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'
  get courses_path
end

ならば /^登録された授業の一覧が開始順に取得できること:$/ do |table|
  page = JSON.parse(last_response.body)
  puts page
end
