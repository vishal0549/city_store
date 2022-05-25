# frozen_string_literal: true

class Admin::DealsController < AdminController
  def index
    @q = params[:deleted] ? Deal.where(deleted: true) : Deal.where(deleted: false)
    @q = @q.ransack(params[:q])
    @deals = @q.result.order('id desc').page(params[:page])
  end

  def new
    @deal = Deal.new
  end

  def create
    @deal = Deal.new(deal_params)

    if @deal.save
      redirect_to admin_deal_path(@deal)
    else
      render :new
    end
  end

  def edit
    @deal = Deal.find(params[:id])
  end

  def update
    @deal = Deal.find(params[:id])
    if @deal.update(deal_params)
      redirect_to admin_deal_path(@deal)
    else
      render :new
    end
  end

  def show
    @deal = Deal.find(params[:id])
  end

  def destroy
    @deal = Deal.find(params[:id])
    @deal.update_attributes(deleted: true, deleted_at: Time.now)
    redirect_to admin_deals_path
  end

  private

  def deal_params
    params.require(:deal).permit(:name, :description, :avatar, :tag_visible, :deleted, :deleted_at)
  end
end
