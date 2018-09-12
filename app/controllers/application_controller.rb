class ApplicationController < ActionController::Base
  include Authentification
  include Authorization
end
