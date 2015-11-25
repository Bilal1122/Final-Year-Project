class HomeController < ApplicationController
  before_action :set_feedback, only: [:destroy, :update]
	def index
	end

	def feedback
		@feedback = Feedback.new
	end

	def create
		@feedback = Feedback.new(feedback_params)
		@feedback.added_by_id = current_user.id
		@feedback.added_by_name = current_user.name
		if @feedback.save
			redirect_to contact_alert_pages_path, notice: "sucess"
		end
	end

	def all_feedbacks
		@all_feedbacks = Feedback.all
	end

  def destroy
    @feedback.destroy
    redirect_to all_feedbacks_home_index_path, alert: "deleted"
  end

	def update
    @feedback.status ="sceen"
    @feedback.update(feedback_params)
    if @feedback.save
      redirect_to all_feedbacks_home_index_path, alert: "Reject"
    end
  end

	private
		def feedback_params
			params.require(:feedback).permit(:added_by_id, :added_by_name, :subject, :feedback, :status)
	  end
	  def set_feedback
      @feedback = Feedback.find(params[:id])
  end
end
