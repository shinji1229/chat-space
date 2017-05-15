FactoryGirl.define do

  factory :message do
    body              { Faker::Lorem.sentence }
    image             { Faker::LoremPixel.image}
  end
end
