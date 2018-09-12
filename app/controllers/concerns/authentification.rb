module Authentification
  extend ActiveSupport::Concern

  included do
    helper_method :current_user
  end

  private

  def current_user
    if @current_user.nil?
      @current_user = User.find_by(id: session[:user_id]) || false
    end

    @current_user
  end
end
