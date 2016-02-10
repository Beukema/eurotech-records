class SearchController < ApplicationController
  def list_results
    @search = params[:q].values[0]
    @repair_orders = RepairOrder.search(@search)
  end
  
  def open_first_result
    
    result = @q.result(distinct: true).includes(:items)[0]
    
    if result
      redirect_to repair_order_path result
    else
      flash[:danger] = "Search not found"
      redirect_to root_path
    end
    
  end
end
