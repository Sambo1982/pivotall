# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :story do
    project_id "MyString"
    external_id "MyString"
    external_project_id "MyString"
    name "MyString"
    description "MyString"
    story_type "MyString"
    current_state "MyString"
    estimate 1.5
    accepted_at "2014-08-28 19:10:40"
    deadline "2014-08-28 19:10:40"
    requested_by_id "MyString"
  end
end
