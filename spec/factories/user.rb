FactoryGirl.define do

pass = Internet.password(8)

  factoty :user do
    name                    { Faker::Internet.user_name }
    email                   { Faker::Internet.email }
    password                pass
    password_confirmation   pass

    after(:create) do |user|
      create_list(:groups, 3, users: [user])
    end
  end
end
