class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(uid: params[:user][:uid], pass: BCrypt::Password.create(params[:user][:pass]), profile: params[:user][:profile])
    if @user.save
      flash[:notice] = 'userを追加しました'
      redirect_to users_path
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(profile: params[:user][:profile])
      flash[:notice] = 'userを更新しました'
      redirect_to users_path
    else
      render 'edit'
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
