module FilterableUsers
  extend ActiveSupport::Concern

  private

  def users_filter(users, params)
    users = filter_by_email(users, params)
    users
  end

  def filter_by_email(users, params)
    users = users.filter_by_email(params[:email]) if params[:email].present?
    users
  end
end
