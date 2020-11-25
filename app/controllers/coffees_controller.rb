class CoffeesController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_coffee, only: [:show, :edit, :update, :destroy]
  
  def index
    @coffees = Coffee.where(user_id: current_user.id).order('created_at DESC')
    # @coffees = Coffee.includes(:user).where(user_id: current_user.id).order("created_at DESC").references(:user)
  end

  def show
  end
  
  def new
    @coffee = Coffee.new
  end

  def create
    @coffee = Coffee.new(coffee_params)
    if @coffee.valid?
      @coffee.save # バリデーションをクリアした時
      redirect_to coffees_path
    else
      render action: 'new' # バリデーションに弾かれた時
    end
  end

  def edit
  end

  def update
    if @coffee.update(coffee_params)
      redirect_to coffees_path
    else
      render action: 'edit'    # バリデーションに弾かれた時
    end
  end

  def destroy
    redirect_to coffees_path if @coffee.destroy
  end

  private

  def coffee_params
    params.require(:coffee).permit(:name, :country_id, :date_of_purchase, :shop, :detail).merge(user_id: current_user.id)
  end

  def set_coffee
    @coffee = Coffee.find(params[:id])
  end

end
