# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :share do
    from_user { create :user }
    url "http://www.example.com"
    
    factory :share_to_user do
      to_user { create :user }
    end
    
    factory :share_to_email do
      email { Faker::Internet.email }
    end
  end
end
