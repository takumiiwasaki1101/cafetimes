class CoffeesController < ApplicationController

  def index
    @coffees = Coffee.all
  end

  def new 
    @coffee = Coffee.new
  end

  def create
    @coffee = Coffee.new(coffee_params)
    if @coffee.valid?
      @coffee.save  # バリデーションをクリアした時
      redirect_to root_path
    else
      render action: 'new' # バリデーションに弾かれた時
    end

  end

  private
  
  def coffee_params
    params.require(:coffee).permit(:name, :country_id, :date_of_purchase, :shop, :detail).merge(user_id: current_user.id)
  end

end

