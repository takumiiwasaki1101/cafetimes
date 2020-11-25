class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_coffee, only: [:new, :create]
  before_action :move_to_coffees_path, only: [:new, :create]

  def index
    # @coffees = Coffee.where(user_id: current_user.id).order('created_at DESC')
    # @coffees = Coffee.includes(:user).where(user_id: current_user.id).order("created_at DESC").references(:user)
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.valid?
      @review.save # バリデーションをクリアした時
      redirect_to user_path(current_user.id)
    else
      render action: 'new' # バリデーションに弾かれた時
    end
  end

  private

  def review_params
    params.require(:review).permit(:date, :tool_id, :review).merge(user_id: current_user.id, coffee_id: params[:coffee_id])
  end

  def set_coffee
    @coffee = Coffee.find(params[:coffee_id])
  end

  def move_to_coffees_path
    redirect_to coffees_path unless current_user.id == @coffee.user_id
  end

end
