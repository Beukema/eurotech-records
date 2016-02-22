class Item < ActiveRecord::Base
  belongs_to :repair_order
  has_many :uploads
end
