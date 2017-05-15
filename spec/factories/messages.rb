FactoryGirl.define do

  factory :message do
    body              { Faker::Lorem.sentence }
    image             { Faker::LoremPixel.image}
    user
    group
    created_at  { Faker::Time.between(2.days.ago, Time.now, :all) }
  end
end
