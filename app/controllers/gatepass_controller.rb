class GatepassController < ApplicationController

  # before_action :set_stock, only: [ :update, :destroy, :show]
	
	def new_gatepass
		@new_gatepass = Gatepass.new
	end

	def create
		@new_gatepass = Gatepass.new(gatepass_params)
		@new_gatepass.made_by = current_user.id
		if @new_gatepass.save
			redirect_to new_gatepass_gatepass_index_path, notice:  "sucess"
		end
	end

	private
		def gatepass_params
			params.require(:gatepass).permit(:order_id, :to_who, :delivered_pcs, :total_amount, :made_by)
	  end
	  def set_stock
      @gatepass = Gatepass.find(params[:id])
  end

end
