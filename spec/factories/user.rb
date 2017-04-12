FactoryGirl.define do

  sequence(:email) { |n| "superteacher#{n}@example.com" }

  factory :user do
    password "password"
    email { FactoryGirl.generate(:email) }

    first_name "Mr."
    last_name "Nobody"
    organisation_id 1

    trait :without_email do
      email nil
    end

    trait :without_names do
      first_name nil
      last_name nil
    end

  end
end
