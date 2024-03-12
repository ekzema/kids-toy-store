# frozen_string_literal: true

class Api::V1::FeedbacksController < ApiController
  def create
    feedback = Feedback.new(feedback_params)

    if feedback.save
      render_response(status: :created)
    else
      render json: feedback.errors, status: :unprocessable_entity
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:name, :email, :subject, :message)
  end
end
