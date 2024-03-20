# frozen_string_literal: true

class Api::V1::Admin::FeedbacksController < AdminController
  before_action :set_feedback, only: %i[show update destroy]

  def index
    feedbacks = Feedback.all
    render_paginate(feedbacks)
  end

  def show
    render_response(@feedback)
  end

  def update
    if @feedback.update(feedback_params)
      render_response(@feedback)
    else
      render json: @feedback.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @feedback.destroy
  end

  private

  def set_feedback
    @feedback = Feedback.find(params[:id])
  end

  def feedback_params
    params.require(:feedback).permit(:moderation)
  end
end
