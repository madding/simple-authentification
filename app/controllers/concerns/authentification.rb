module Authentification
  extend ActiveSupport::Concern

  included do
    helper_method :current_user
  end

  def current_user
    if @current_user.nil?
      @current_user = User.find_by(user_token: session[:current_user_token]) || false
    end

    @current_user
  end
end
