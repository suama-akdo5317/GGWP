class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  # deviseのpermitted_parameterを追加する(無くてもいい？)
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username])
    # deviseのpermitted_parameterを追加する(無くてもいい？)
    # devise_parameter_sanitizer.permit(:account_update, keys: %i(avatar))
    # devise_parameter_sanitizer.permit(:account_update, keys: [:avatar] )

    end

  def after_sign_in_path_for(resource)
    user_path(resource.id)
  end

  def counts(user)
    @count_posts = user.posts.count
    @count_followings = user.followings.count
    @count_followers = user.followers.count
  end

end