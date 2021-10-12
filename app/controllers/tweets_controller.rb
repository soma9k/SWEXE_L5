class TweetsController < ApplicationController
  def index
     @tweet = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(message: params[:tweet][:message], user_id: session[:login_uid])
    if @tweet.save
      flash[:notice] = '1レコード追加しました'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    if tweet.destroy
      flash[:notice] = '1レコード削除しました'
    end
    redirect_to root_path
  end
end
