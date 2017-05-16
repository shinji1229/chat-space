FactoryGirl.define do

sequence(:name) { |n| "group-#{n}" }

  factory :group do
    name
    created_at  { Faker::Time.between(2.days.ago, Time.now, :all) }
  end
end
