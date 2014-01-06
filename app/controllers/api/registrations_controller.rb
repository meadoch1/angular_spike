class Api::RegistrationsController < ApplicationController
  respond_to :json

  def index
    render :json => User.all
  end

  def show
    render :json => User.find(params[:id])
  end

  def create
    params[:registration].delete :isUsernameUnique
    user = User.new(params[:registration])
    if user.save
      render :json=> {}, :status=>201
      return
    else
      warden.custom_failure!
      render :json=> user.errors, :status=>422
    end
  end

  def update
    params[:registration].delete :id
    params[:registration].delete :isUsernameUnique
    render :json => User.update(params[:id], params[:registration])
  end

  def destroy
    respond_with User.destroy(params[:id])
  end

  def unique
    count = User.where(username: params[:username]).count
    render :json => { unique: count == 0 }
  end
end
