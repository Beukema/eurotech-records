class RepairOrder < ActiveRecord::Base
  has_many :items, dependent: :destroy
  accepts_nested_attributes_for :items, allow_destroy: true
  
  validates :ro_number, uniqueness: true, presence: true
  
  def updated_last
    soonest_date = updated_at
    items.each do |i|
      if i.updated_at > soonest_date
        soonest_date = i.updated_at
      end
    end
    
    return soonest_date
  end
  
  def self.search(text)
    results = []
    
    RepairOrder.all.each do |r|
      results << r unless r.concat_all_fields.downcase.index(text.downcase).nil?
    end
    
    results.sort! { |a,b| b.ro_number <=> a.ro_number }
  end
  
  def highlight_fields(text)
    full_text = concat_all_fields
    
    start_index = full_text.downcase.index(text.downcase)
    
    end_index = text.length + start_index
    
    text_offset = 80
    
    if start_index > text_offset
      start_index = start_index - text_offset
    else
      start_index = 0
    end
    
    if end_index + text_offset < full_text.length
      end_index = end_index + text_offset
    else
      end_index = full_text.length - 1
    end
    
    modified_text = full_text[start_index..end_index]
    
    modified_text.gsub!(/#{text}/i, "<span class='highlight'>#{text}</span>")
    
    modified_text = "..." + modified_text unless start_index == 0
    modified_text = modified_text + "..." unless end_index == full_text.length - 1
    
    return modified_text
  end
  

  
  def concat_all_fields
    full_text = "#{year} #{model}"
    
    items.each do |i|
      full_text += " " + i.cause + " " + i.correction
    end
    
    full_text += " " + recommendations + " " + maintenance 
    return full_text
  end
end
