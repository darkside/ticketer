# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username  { Faker::Internet.user_name }
  end
end

