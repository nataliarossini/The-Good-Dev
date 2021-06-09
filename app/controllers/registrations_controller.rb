class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    if resource.organization?
      :new_organization
    else
      :dashboard
    end
  end
end
