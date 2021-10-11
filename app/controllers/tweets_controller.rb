class TweetsController < ApplicationController
  def index
     @tweet = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(message: params[:tweet][:message])
    if @tweet.save
      flash[:notice] = '1レコード追加しました'
      redirect_to tweets_path
    else
      render 'new'
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    if tweet.destroy
      flash[:notice] = '1レコード削除しました'
    end
    redirect_to tweets_path
  end
end
