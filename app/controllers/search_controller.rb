class SearchController < ApplicationController
  def index
    @q = RepairOrder.ransack(params[:q])
    @results = @q.result.includes(:items)
    @repair_orders = @q.result.includes(:items)
    
#    @results = RepairOrder.search(name_cont: params[:q]).result
  end
end
