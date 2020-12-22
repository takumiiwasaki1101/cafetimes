class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all.order('created_at DESC')
  end

  def show
    @user = User.find(params[:id])
    @coffees = Coffee.where(user_id: @user.id)
    @coffee  = Coffee.where(user_id: @user.id).order('created_at DESC').first
    @reviews = Review.where(user_id: @user.id).includes(:coffee).order('date DESC')
  end
end
