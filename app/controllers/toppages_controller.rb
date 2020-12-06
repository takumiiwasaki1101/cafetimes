class ToppagesController < ApplicationController
  def index
    @reviews = Review.includes(:coffee, :user).order('created_at DESC')
  end
end
