FactoryBot.define do
  factory :user do
    email {'FakeEmail@fake.com'}
    password {'FakePW123'}
    password_confirmation {'FakePW123'}

    trait :make_admin do
      role {:admin}
    end

    trait :make_org do
      role {'organization'}
      organization
    end
  end
end