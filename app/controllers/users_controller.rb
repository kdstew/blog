class UsersController < ApplicationController
  respond_to :html, :json
  # index, show, edit, update, new, create, destroy

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    
    @user.update_attributes(params[:user])
    respond_with @user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      'Successful'
    else
      'Save failed'
    end
    respond_with @user
  end

end
