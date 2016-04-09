class RepairOrdersController < ApplicationController

  before_action :set_repair_order, only: [:show, :edit, :update, :destroy]

  def index
    @q = RepairOrder.ransack(params[:q])
    @repair_orders = RepairOrder.paginate(page: params[:page]).order(ro_number: :desc)
  end

  def show
  end

  def new
    @repair_order = RepairOrder.new
    1.times do
      items = @repair_order.items.build
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @repair_order.update(repair_order_params)
        flash[:success] = "Repair Order ##{@repair_order.ro_number} was successfully updated."
        format.html { redirect_to @repair_order }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @repair_order.destroy
    respond_to do |format|
      format.html { redirect_to repair_orders_url, notice: 'Repair order was successfully destroyed.' }
    end
  end

  def create
    @repair_order = RepairOrder.new(repair_order_params)

    respond_to do |format|
      if @repair_order.save
        format.html { redirect_to @repair_order, notice: 'repair_order was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end


  private

  def set_repair_order
    @repair_order = RepairOrder.find(params[:id])
  end

  def repair_order_params
    params.require(:repair_order)
    .permit(:ro_number, :year, :model, :recommendations, :maintenance, items_attributes: [:id, :cause, :correction, :_destroy])
  end

end
