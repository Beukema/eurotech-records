json.array!(@repair_order_records) do |repair_order_record|
  json.extract! repair_order_record, :id, :repair_order, :recommendations, :maintenance
  json.url repair_order_record_url(repair_order_record, format: :json)
end
