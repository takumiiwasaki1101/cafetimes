class ToppagesController < ApplicationController
  def index
    @reviews = Review.includes(:coffee, :user).order('date DESC').limit(4)
  end
end
