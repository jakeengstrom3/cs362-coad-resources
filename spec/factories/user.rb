FactoryBot.define do
  factory :user do
    email {"FakeEmail"}
    password {"FakePW"}

    trait :make_admin do
      role {:admin}
    end

    trait :make_org do
      role {:organization}
    end
  end
end