FactoryGirl.define do
  factory :currency do
    sequence(:name) { |n| "currency #{n}" }
    per_us_dollar 10
  end
end
