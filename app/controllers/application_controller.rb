class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
<<<<<<< HEAD

  before_action :authenticate_player!, except: [:sign_in, :sign_up]
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end



=======
>>>>>>> bf6136f1f4a987b88bf68a673029293171318f94
end
