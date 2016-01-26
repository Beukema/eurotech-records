FactoryGirl.define do
  factory :repair_order do
    sequence(:ro_number)
    recommendations "Needs new tires on next checkup, as well as a patch on their exhaust."
    maintenance "Oil change, and fluid fills."
  end
  
  factory :repair_order_with_causes do
    sequence(:ro_number)
    recommendations "Needs new tires on next checkup, as well as a patch on their exhaust."
    maintenance "Oil change, and fluid fills."
    
    after(:create) do |repair_order|
      2.times do
        create(:item, repair_order: repair_order)
      end
    end
  end
end
