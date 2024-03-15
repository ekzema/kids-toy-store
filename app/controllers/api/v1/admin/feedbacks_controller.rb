# frozen_string_literal: true

class Api::V1::Admin::FeedbacksController < AdminController
  def index
    feedbacks = Feedback.all
    render_paginate(feedbacks)
  end

  private

  def feedback_params
    params.require(:feedback).permit(:name, :email, :subject, :message, :moderation)
  end
end
