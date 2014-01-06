class ConfirmationsController < Devise::ConfirmationsController
  def new
    super
  end

  def create
    super
  end

  protected
  def after_confirmation_path_for(resource_name, resource)
    if signed_in?
      registrations_personal_info_path
    else
      new_session_path(resource_name)
    end
  end
end
