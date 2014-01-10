class Api::ValidationsController < ApplicationController
  respond_to :json

  # def index
  #   render :json => User.all
  # end

  # def show
  #   render :json => User.find(params[:id])
  # end

  # def create
  #   params[:registration].delete :isUsernameUnique
  #   user = User.new(params[:registration])
  #   if user.save
  #     render :json=> {}, :status=>201
  #     return
  #   else
  #     warden.custom_failure!
  #     render :json=> user.errors, :status=>422
  #   end
  # end

  # def update
  #   params[:registration].delete :id
  #   params[:registration].delete :isUsernameUnique
  #   render :json => User.update(params[:id], params[:registration])
  # end

  # def destroy
  #   respond_with User.destroy(params[:id])
  # end

  def fetch
    klass = lookup_class(params[:classid])
    fields = JSON.parse params[:fields]
    if klass && fields
      vals = RailsToNgValidationTranslator.translate klass, fields.map{ |field| field.to_sym }
      render :json => { validations: vals }
    else
      render :nothing
    end
  end

  private
  def lookup_class(class_id)
    return User if class_id == "User"
  end
end
