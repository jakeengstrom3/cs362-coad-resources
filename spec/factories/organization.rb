FactoryBot.define do
  factory :organization do
    name {"FAKE NAME"}
    phone {1111111111}
    email {"Fake@Email.com"}
    description {"This is a fake description"}
    rejection_reason {"No reason"}
    liability_insurance {false}
    primary_name {"Fake Primary Name"}
    secondary_name {"Fake Seondary Name"}
    secondary_phone {2222222222}
    title {"Fake Title"}
  end
end