class TopController < ApplicationController
  def main
    @tweet = Tweet.all
  end
    
  def login
    @tweet = Tweet.all
    user = User.find_by(uid: params[:uid])
    if user and BCrypt::Password.new(user.pass) == params[:pass]
       session[:login_uid] = params[:uid]
       render 'top/main'
    else
      render 'login'
    end
  end
  
  def logout
    session.delete(:login_uid)
    redirect_to root_path
  end
end
