FactoryBot.define do
  factory :organization do
    sequence(:name) {|n| "Organization # #{n}"}
    phone {1111111111}
    sequence(:email) {|n| "email#{n}@fake.com"}
    description {"This is a fake description"}
    rejection_reason {"No reason"}
    liability_insurance {false}
    primary_name {"Fake Primary Name"}
    secondary_name {"Fake Seondary Name"}
    secondary_phone {2222222222}
    title {"Fake Title"}

    trait :set_submitted do 
      status {:submitted}
    end
      
    trait :set_rejected do
      status {:rejected}
    end

    trait :set_approved do
      status {:approved}
    end
  end
end