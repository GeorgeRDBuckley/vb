class RegistrationsController < Devise::RegistrationsController
  protected

  def update_resource(resource, params)
    return super if params["password"]&.present?
    resource.update_without_password(params)
  end

  def after_update_path_for(resource)
    show_profile_path(resource.username)
  end
end
