class StockController < ApplicationController
  before_action :set_stock, only: [ :update, :destroy, :show]
  before_action :authorize_admin, only: [:show]

	def all_stock
		@all_stock = Stock.all.order('id DESC')
	end

	def add_new
		@stock = Stock.new
	end

	def create
		@stock = Stock.new(stock_params)
		@stock.added_by = current_user.id
		if @stock.save
			redirect_to all_stock_stock_index_path, notice:  "sucess"
		end
	end

	def update
		@stock.last_updated = Time.now
		@stock.update(stock_params)
		if @stock.save
			redirect_to all_stock_stock_index_path, alert: "Sucess"
		else
			redirect_to all_stock_stock_index_path, alert: "Failed"
		end
	end

	def show
		@stock
	end

	def destroy
    @stock.destroy
    redirect_to all_stock_stock_index_path, alert: "deleted"
  end

	private
		def stock_params
			params.require(:stock).permit(:accessory_name, :accessory_quantity, :accessory_price_per_pcs, :used_accessory, :last_updated, :added_by, :description)
	  end
	  def set_stock
      @stock = Stock.find(params[:id])
  end
end

