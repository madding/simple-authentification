module Authorization
  extend ActiveSupport::Concern

  included do
    helper_method :login_required?, :admin_required?
  end

  private

  def login_required?
    unless current_user
      flash[:danger] = 'Access denied! Please Log In'
      redirect_to new_user_session_path
    end
  end

  def admin_required?
    if !current_user || !current_user.admin?
      flash[:danger] = 'Access denied! Please Log In'
      redirect_to new_user_session_path, danger: 'Access denied'
    end
  end
end
