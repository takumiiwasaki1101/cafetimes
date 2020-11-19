class CoffeesController < ApplicationController

  def index
    @coffees = Coffee.all
  end

  def new 
    @coffee = Coffee.new
  end
  
end
