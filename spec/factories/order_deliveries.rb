FactoryBot.define do
  factory :order_delivery do
    postal_code {'123-4567'}
    prefecture_id {2}
    municipalities {'函館市'}
    address {'1-2-3'}
    building {'武道館'}
    telephone_number {'08012345678'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
