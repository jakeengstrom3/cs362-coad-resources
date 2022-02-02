FactoryBot.define do
  factory :ticket do
    name {"FAKE NAME"}
    description {"FAKE DESCRIPTION"}
    phone {"FAKE PHONE"}
    organization_id {"FAKE ORGANIZATION_id"}
    closed {false}
    resource_category_id {"FAKE RESOURCE CATEGORY ID"}
    region_id {"FAKE REGION ID"}
  end
end