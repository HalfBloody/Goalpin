


FactoryGirl.define do
  factory :user do
    email "tester1@menocino.abc"
    association :challenge

    trait :with_invite do
      invite
    end
  factory :user_with_invite, traits: [:with_invite]
  end
end
