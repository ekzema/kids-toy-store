# frozen_string_literal: true

class ApplicationService
  def initialize(params = {})
    @params = params
  end

  def self.perform(params = {}, &block)
    new(params).call(&block)
  end

  private

  def current_user
    params[:current_user].presence
  end

  attr_reader :params
end
