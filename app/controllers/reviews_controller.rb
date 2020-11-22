class ReviewsController < ApplicationController
  def index
    # @coffees = Coffee.where(user_id: current_user.id).order('created_at DESC')
    # @coffees = Coffee.includes(:user).where(user_id: current_user.id).order("created_at DESC").references(:user)
  end

  def new
    @coffee = Coffee.find(params[:id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.valid?
      @review.save # バリデーションをクリアした時
      redirect_to root_path
    else
      render action: 'new' # バリデーションに弾かれた時
    end
  end

  private

  def review_params
    params.require(:review).permit(:date, :text).merge(user_id: current_user.id, coffee_id: params[:coffee_id])
  end

end
