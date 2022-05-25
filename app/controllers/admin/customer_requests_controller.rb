# frozen_string_literal: true

class Admin::CustomerRequestsController < AdminController
  def index
    @customer_requests = CustomerRequest.order('id desc').page(params[:page])
  end

  def destroy
    @customer_request = CustomerRequest.find(params[:id])
    @customer_request.destroy
    redirect_to admin_customer_requests_path
  end
end
