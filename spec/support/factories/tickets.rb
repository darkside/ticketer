# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ticket do
    name { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    user
    status { Ticket::STATUSES.shuffle.first }
  end
end

