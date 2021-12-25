class ApplicationController < ActionController::Base
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception


  private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end

    def render_404
      render file: "public/404.html", status: 404
    end

    def render_403
      render file: "public/403.html", status: 403
    end

end
