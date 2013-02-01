class ApplicationController < ActionController::Base
  before_filter :first_visit
  protect_from_forgery

  def first_visit
    if cookies[:last_visit] == "" || nil
      update_last_visit
    end
      logger.info("UPDATED COOKIE")
    end

  def update_last_visit
    cookies.permanent[:last_visit] = Time.now.utc
    logger.info("you printed")
  end

end
