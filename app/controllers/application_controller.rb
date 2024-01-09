class ApplicationController < ActionController::Base
    before_action :authenticate_user!, except: [:top]
    before_action :configure_parmitted_parameters,if: :devise_controller?
    
    def after_sign_in_path_for(resource)
        flash[:notice]
        user_path(@user)
    end
    
    def after_sign_out_path_for(resource)
        flash[:notice]
        root_path
    end
    
    protected
    
    def configure_parmitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email])
    end
end
