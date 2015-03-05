class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.page(params[:page]).per_page(25)
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

  def edit
    @user = current_user
    @users = User.all
  end

end