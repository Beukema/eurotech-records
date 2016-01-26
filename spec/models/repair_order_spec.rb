require 'rails_helper'

RSpec.describe RepairOrder, :type => :model do
  
  it "should have a unique repair order number" do
    repair_order1 = create(:repair_order, ro_number: 5)
    expect(repair_order1).to be_valid
    
    repair_order2 = build(:repair_order, ro_number: 5)
    expect(repair_order2).to be_invalid
  end
  
  it "should not have an empty repair order number" do
    repair_order1 = build(:repair_order, ro_number: "")
    expect(repair_order1).to be_invalid
  end
  
  it "should accept an association with multiple items" do
    repair_order = create(:repair_order)
    2.times do
      repair_order.items << create(:item)
    end
    
    expect(repair_order).to be_valid
  end
end
