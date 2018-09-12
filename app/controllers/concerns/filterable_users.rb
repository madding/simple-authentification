module FilterableUsers
  extend ActiveSupport::Concern

  private

  def users_filter(users, params)
    filter_by_email(users, params)
  end

  def filter_by_email(users, params)
    if params[:query] && params[:query][:email].present?
      return users.filter_by_email(params[:query][:email])
    end

    users
  end
end
