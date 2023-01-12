# frozen_string_literal: true

module Paginate
  extend ActiveSupport::Concern

  private

  def render_paginate(collection, *options_serializer, limit: 20)
    collection_count = { count: collection.count(:all) }
    data = collection.offset(prepare_offset(limit)).limit(limit)

    render_response(data, *options_serializer, expand: collection_count)
  end

  def prepare_offset(limit)
    page = params[:page] ? params[:page].to_i : 1
    (page * limit) - limit
  end
end
