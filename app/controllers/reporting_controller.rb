class ReportingController < ApplicationController
	before_action :authorize_admin
	before_action :check_user
	def index
		@invoice = Invoice.where("created_at >= ? AND created_at <= ?", Time.zone.now.beginning_of_month, Time.zone.now.end_of_month).order(id: :desc).to_a
		@orders_stat = Order.where("created_at >= ? AND created_at <= ?", Time.zone.now.beginning_of_month, Time.zone.now.end_of_month).order(id: :desc).to_a
	end

	def expense
		@all_expenses = Invoice.this_months_invoice.where(invoice_type:  "Expense").order(id: :desc).to_a
	end
	def expenses_history
		@expenses_history = Invoice.where(invoice_type:  "Expense").order(id: :desc).to_a
	end

	def sales
		@all_sales = Invoice.this_months_invoice.where(invoice_type:  "sales").order(id: :desc).to_a
	end
	def sales_history
		@sales_history = Invoice.where(invoice_type:  "sales").order(id: :desc).to_a
	end

	def orders
		@orders = Order.where("created_at >= ? AND created_at <= ?", Time.zone.now.beginning_of_month, Time.zone.now.end_of_month).order(id: :desc).to_a
	end
	def orders_history
		@orders_history = Order.all.order(id: :desc).to_a
	end
	
	def payroll
		@payrolls = Invoice.this_months_invoice.where(invoice_type:  "payrols").order(id: :desc).to_a
	end
	def payrol_history
		@payrol_history = Invoice.where(invoice_type:  "payrols").order(id: :desc).to_a
	end

	def invoices
		@invoices = Invoice.this_months_invoice.order(id: :desc).to_a
	end
	def invoice_history
		@invoice_history = Invoice.all.order(id: :desc).to_a
	end

	def gatepass
		@gatepass = Gatepass.where("created_at >= ? AND created_at <= ?", Time.zone.now.beginning_of_month, Time.zone.now.end_of_month).order(id: :desc).to_a
	end
	def gatepass_history
		@gatepass_history = Gatepass.all
	end

	def enquire
		@enquire = ContactU.all
	end

	def leave_appliction
		@leave_applictionns = Leave.all
	end

	def unpaid_orders
		@unpaid_orders = Order.where(payment_status: "unpaid").order(id: :desc).to_a
	end
	def paid_orders
		@paid_orders = Order.where(payment_status: "paid").order(id: :desc).to_a
	end

end