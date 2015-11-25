class InvoiceController < ApplicationController
  before_action :set_invoice, only: [:show, :update]
  before_action :authorize_admin, only: [:new_invoice, :all_invoices]


	def new_invoice
		@invoice = Invoice.new
	end

	def create
		@invoice = Invoice.new(invoice_params)
		if @invoice.save
			redirect_to new_invoice_invoice_index_path, notice:  "sucess"
		end
	end

	def all_invoices
		@all_invoice = Invoice.this_months_invoice
	end

	def invoice_history
		@invoice_history = Invoice.this_months_invoice_history
	end

	def show
		@invoice
	end

	def update
		@invoice.update(invoice_params)
    if @invoice.save
      redirect_to invoice_path, alert: "Reject"
    else
      redirect_to invoice_path, alert: "Reject"
    end
	end

	private
		def invoice_params
			params.require(:invoice).permit(:personname, :invoice_type, :amount, :description, :image)
	  end
	  def set_invoice
      @invoice = Invoice.find(params[:id])
    end
end
