class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  
  # activestorageのアバター機能
      devise_parameter_sanitizer.permit(:sign_up, keys: [ :avatar] )
      devise_parameter_sanitizer.permit(:account_update, keys: [ :avatar])
    end

  def after_sign_in_path_for(resource)
    user_path(resource.id)
  end

=begin これがあるとエラーになるよ  
  def counts(user)
    @count_posts = user.post.count
  end
=end

end
