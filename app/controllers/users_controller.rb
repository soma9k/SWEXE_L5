class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(uid: params[:user][:uid], pass: BCrypt::Password.create(params[:user][:pass]))
    if @user.save
      flash[:notice] = 'userを追加しました'
      redirect_to users_path
    else
      render 'new'
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
     flash[:notice] = 'userを削除しました'
    end
    redirect_to users_path
  end
end
