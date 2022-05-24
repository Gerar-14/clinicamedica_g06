class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    def after_sign_in_path_for(resource)
        home_path
    end

    def after_sign_out_path_for(resource)
        user_session_path
    end


    def after_sign_up_path_for(resource)
        redirect_to new_empleado_path
    end
end
