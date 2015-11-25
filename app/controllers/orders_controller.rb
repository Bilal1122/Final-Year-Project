class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :in_progress, :update, :destroy]
  before_action :authorize_admin, only: [:new_order]

	def new_order
		@order = Order.new
	end

	def create
		@order = Order.new(order_params)
		@order.created_by_id = current_user.id
		@order.created_by_name = current_user.name
		if @order.save
			redirect_to new_order_orders_path, notice:  "sucess"
		end
	end

	def orders_list
		@orders_list = Order.where(order_status: "pending")
	end

	def show
		@order
		@gatepass = @order.gatepasses
	end

	def in_progress
    @order.update(order_params)
    if @order.save
      redirect_to order_path, alert: "Reject"
    else
      redirect_to order_path, alert: "Reject"
    end
	end

	def update
    @order.update(order_params)
    if @order.save
      redirect_to order_path, alert: "Reject"
    else
      redirect_to order_path, alert: "Reject"
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_list_orders_path, alert: "deleted"
  end

  def in_progress_orders
  	@in_progress_orders_list = Order.where(order_status: "in_progress")
  end

	def completed_orders
  	@completed_orders_list = Order.where(order_status: "completed")
  end

  def delivered_orders
  	@delivered_orders_list = Order.where(order_status: "delivered")
  end

	private
	def order_params
		params.require(:order).permit(:customer_name, :email, :phn_number, :nric, :company_name, :address, :quantity, :sizing, :fabric_type, :delivery_date, :order_status, :description, :extra_note, :created_by_id, :created_by_name, :payment_status, :price_per_piece, :image, :image1)
	end
	def set_order
    @order = Order.find(params[:id])
  end
end

