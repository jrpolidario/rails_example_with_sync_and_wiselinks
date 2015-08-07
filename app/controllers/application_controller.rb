class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # OVERRIDE (Use also default application.html.erb layout for wiselinks rendering)
  def wiselinks_layout
    'layouts/application'
  end
end
