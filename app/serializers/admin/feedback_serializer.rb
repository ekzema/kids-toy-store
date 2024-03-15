# frozen_string_literal: true

class Admin::FeedbackSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :subject, :message, :moderation
end
