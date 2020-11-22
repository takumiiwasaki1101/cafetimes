class ReviewsController < ApplicationController
  def index
    @coffees = Coffee.where(user_id: current_user.id).order('created_at DESC')
    # @coffees = Coffee.includes(:user).where(user_id: current_user.id).order("created_at DESC").references(:user)
  end

  def new
    @coffee = Coffee.new
  end

  def create
    @coffee = Coffee.new(coffee_params)
    if @coffee.valid?
      @coffee.save # バリデーションをクリアした時
      redirect_to root_path
    else
      render action: 'new' # バリデーションに弾かれた時
    end
  end
end
