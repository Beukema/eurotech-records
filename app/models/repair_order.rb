class RepairOrder < ActiveRecord::Base
  has_many :items
  accepts_nested_attributes_for :items, allow_destroy: true
  
  validates :ro_number, uniqueness: true, presence: true
end
