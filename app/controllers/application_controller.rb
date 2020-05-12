class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller? 
    before_action :get_cat
    attr_accessor :categories
    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:avatar])
    end
    def get_cat
        @categories=Category.all()
    end
    # def after_sign_in_path_for(resource)
    #     '/' 
    #   end
end
