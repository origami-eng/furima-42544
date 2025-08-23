FactoryBot.define do
  factory :purchase_address do
    zip_code     { '123-4567' }
    state_id     { 10 }
    city         { '東京都' }
    street       { '渋谷区道玄坂1-2-3' }
    building     { 'ハイツ渋谷101' }
    phone_number { '09012345678' }
    token        { 'tok_abcdefghijk00000000000000000' }
  end
end