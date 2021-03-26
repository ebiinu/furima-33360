FactoryBot.define do
  factory :order_address do
    postal_code                  { '206-0021' }
    prefecture_id                { 2 }
    city                         { '多摩市' }
    house_number                 { '連光寺1-29-15' }
    building_name                { 'ううう' }
    phone_number                 { '09017057739' }
    token                        {"tok_abcdefghijk00000000000000000"}
    user_id                      { 4 }
    item_id                      { 8 }

  end
end
