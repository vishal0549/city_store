# frozen_string_literal: true

class HomeController < ApplicationController
  def terms; end

  def privacy; end

  def about; end

  def submit_request
    if params[:email].present? && params[:subject].present? && params[:message].present?
      CustomerRequest.create(email: params[:email],
                             subject: params[:subject],
                             message: params[:message])
      #ApplicationMailer.customer_request(params[:email], params[:subject], params[:message]).deliver
    end
    redirect_to contact_path, notice: 'Your feedback/query is successfully sent.'
  end
end
