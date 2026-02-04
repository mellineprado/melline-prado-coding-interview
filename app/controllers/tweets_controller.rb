class TweetsController < ApplicationController
  def index
    tweets = Tweet.all

    tweets = tweets.by_user_id(params[:user_id]) if params[:user_id].present?
    render json: tweets
  end
end
