class PagesController < ApplicationController
	
	def index
		@product = Product.all
	end

	def for_men
		@men_product = Product.where(gender: "Men")
	end

	def for_women
		@women_product = Product.where(gender: "Womens")
	end

	def contact_us
		@contact_us = ContactU.new
	end

	def create
		@contact_us = ContactU.new(contact_params)
		if @contact_us.save
			redirect_to contact_alert_pages_path, notice: "sucess"
		end
	end

	private
		def contact_params
			params.require(:contact_u).permit(:name, :email, :subject, :message)
	  end
	  def set_stock
      @gatepass = ContactU.find(params[:id])
  end
end
