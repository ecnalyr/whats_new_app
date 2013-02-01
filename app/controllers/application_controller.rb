class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :first_visit

  def first_visit
    logger.info(cookies[:last_visit])
    if cookies[:last_visit] == nil || ""
      update_last_visit
      logger.info("UPDATED COOKIE")
    else
      logger.info("DID NOT UPDATE COOKIE")
    end
  end

  def update_last_visit
    cookies.permanent[:last_visit] = Time.now.utc.to_s
    logger.info("you just updated last_visit cookie")
  end

end
