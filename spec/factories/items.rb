FactoryBot.define do
  factory :item do
    name                  { 'test' }
    introduction          { "test" }
    category_id           { 2 }
    condition_id          { 2 }
    delivery_fee_payer_id { 2 }
    prefecture_id         { 2 }
    preparing_day_id      { 2 }
    price                 { 2222 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    association :user
  end
end
