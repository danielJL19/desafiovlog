class ApplicationController < ActionController::Base
    #kind es tipo, es decir, uno define las cadenas de caracteres o enum que pueden
    #realizar tal acción. 
    #sino, incluye ninguno de esos roles o cadena de caracteres entregados, dentro de 
    #ese parametro, los llevara a tirar un error 
    def authorize_request (kind=nil)
        unless kind.include?(current_user.role)
            redirecto_to root_path, alert:"No estás autorizado para realizar esta acción"
        end
    end

    def after_sign_out_path_for(resource)
        return new_user_session_path
    end

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :lastName])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :lastName])
    end

    def after_sign_in_path_for(resource)
        root_path
    end

end
