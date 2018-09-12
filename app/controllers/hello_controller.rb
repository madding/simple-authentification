class HelloController < ApplicationController
  before_action :login_required?
end
