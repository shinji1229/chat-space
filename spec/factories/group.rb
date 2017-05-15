FactoryGirl.define do

  sequence(:name) { |n| "group-#{n}" }

  factoty :group do
    name
    end
  end
end
