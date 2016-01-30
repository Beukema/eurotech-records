class SearchController < ApplicationController
  def index
    @q = RepairOrder.ransack(params[:q])

    @repair_orders = @q.result(distinct: true).includes(:items)
    puts @repair_orders.inspect

  end
end
