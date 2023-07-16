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
end
