class LeaveApplicationsController < ApplicationController
  before_action :set_leave_application, only: [:update, :show]
  before_action :authorize_admin, only: [:all_leave_applications, :history_application]

	def new_leave_application
		@new_leave_application = Leave.new
	end

	def create
		@new_leave_application = Leave.new(leave_application_params)
		@new_leave_application.person_id = current_user.id
		@new_leave_application.person_name = current_user.name
		if @new_leave_application.save
			redirect_to new_leave_application_leave_applications_path, notice:  "sucess"
		end
	end

	def all_leave_applications
		@leave_appliction = Leave.where(status: "pending")
	end

	def history_application
		@history_application = Leave.all.where(status: ["Approved", "Rejected"])
	end

	def show
		@leave_appliction
	end

	def applied_leaves
		@applied_leaves = Leave.where(:person_id == current_user.id)
	end

	def update
		@leave_appliction.status = "accepted"
		@leave_appliction.update(leave_application_params)
		if @leave_appliction.save
			redirect_to all_leave_applications_leave_applications_path, notice: "Sucess"
		end
	end

	private
		def leave_application_params
			params.require(:leave).permit(:person_id, :person_name, :from_when, :number_of_days, :subject, :description, :status, :image)
	  end
	  def set_leave_application
      @leave_appliction = Leave.find(params[:id])
  end
end