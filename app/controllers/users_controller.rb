class UsersController < ApplicationController
  def show
    @coffees = Coffee.where(user_id: current_user.id).order('created_at DESC')
    @coffee  = Coffee.where(user_id: current_user.id).order('created_at DESC').first
    @reviews = Review.where(user_id: current_user.id).order('created_at DESC')
  end
end
