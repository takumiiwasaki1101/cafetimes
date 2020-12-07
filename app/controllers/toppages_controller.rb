class ToppagesController < ApplicationController
  def index
    @reviews = Review.includes(:coffee, :user).order('created_at DESC').limit(6)
  end
end
