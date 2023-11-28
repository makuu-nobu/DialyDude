class ApplicationController < ActionController::Base
    before_action :configure_permitter_parameters, if: :devise_controller?
    before_action :basic_auth, if: :devise_sign_up?

    private
    def configure_permitter_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :position])        
    end

    def basic_auth
        authenticate_or_request_with_http_basic do |username, password|
        username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
        end
    end

    def devise_sign_up?
        controller_name == 'registrations' && action_name == 'new'
    end
end
