#class RegistrationsController < ApplicationController
class RegistrationsController < Devise::RegistrationsController
  layout "ng_form_layout"

  def new
    @attributes = [:username, :password, :password_confirmation, :email]
    @validations = RailsToNgValidationTranslator.translate User, @attributes
    super
  end

  def create
    super
  end

  def update
    super
  end

  def personal_info
    @attributes = [:last_name, :dob, :last4ssn]
    @field_types = {last_name: 'text', dob: 'date', last4ssn: 'text'}
    @validations = RailsToNgValidationTranslator.translate User, @attributes
    @user = current_user
  end
end
