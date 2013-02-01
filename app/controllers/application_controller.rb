class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :first_visit

  def first_visit
    if cookies[:last_visit] == ""
      update_last_visit
    end
  end

  def update_last_visit
    cookies.permanent[:last_visit] = Time.now.utc
    logger.info("you printed")
  end

end
