class ApplicationController < ActionController::Base
    # permit the name parameter. In your application_controller.rb file, add a configuration for parameter sanitization.
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
end
