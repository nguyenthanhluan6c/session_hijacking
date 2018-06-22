class Auth::SessionsController < Devise::SessionsController
  def new
    super
  end

  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)

    session[:user_agent] = request.user_agent
    session[:ip] = request.ip

    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end
end