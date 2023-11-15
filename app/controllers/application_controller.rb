class ApplicationController < ActionController::Base
    before_action :configure_permitter_parameters, if: :devise_controller?

    private
    def configure_permitter_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :position])        
    end
end
