class TweetsController < ApplicationController
  def index
    tweets = Tweet.order(created_at: :desc)

    tweets = tweets.by_user_id(params[:user_id]) if params[:user_id].present?

    page = (params[:page] || 1).to_i
    per_page = (params[:per_page] || 5).to_i

    tweets = tweets.limit(per_page).offset((page - 1) * per_page)
    render json: tweets
  end
end
