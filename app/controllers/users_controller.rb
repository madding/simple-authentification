class UsersController < ApplicationController
  include FilterableUsers
  include Pagination
  per_page_default 5

  before_action :admin_required?, except: %i[new create]
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = users_filter(User.all, params)
    @users = @users.paginate(per_page, current_page)
  end

  def new
    @user = User.new

    render layout: 'authentification'
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to new_user_session_path, notice: 'User was successfully created. Please sign in now.'
    else
      render :new, layout: 'authentification'
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy

    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(%i[email password admin])
  end
end
