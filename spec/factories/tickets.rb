FactoryBot.define do
  factory :ticket do
    name {"FAKE NAME"}
    description {"FAKE DESCRIPTION"}
    phone {"+15416410681"}
    closed {false}
    resource_category
    region
    organization
  end
end