# frozen_string_literal: true

class Api::V1::Admin::FeedbacksController < AdminController
  before_action :set_feedback, only: %i[destroy]

  def index
    feedbacks = Feedback.all
    render_paginate(feedbacks)
  end

  def destroy
    @feedback.destroy
  end

  private

  def set_feedback
    @feedback = Feedback.find(params[:id])
  end

  def feedback_params
    params.require(:feedback).permit(:name, :email, :subject, :message, :moderation)
  end
end
