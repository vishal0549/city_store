# frozen_string_literal: true

class AdminController < ApplicationController
  before_action :admin_required
  layout 'admin'

  def admin_required
    authenticate_or_request_with_http_digest do |username|
      ENV['admin']
    end
  end
end
