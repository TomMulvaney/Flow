class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def check_admin
    puts session
  end
end
