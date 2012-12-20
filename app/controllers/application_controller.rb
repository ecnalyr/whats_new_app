class ApplicationController < ActionController::Base
  protect_from_forgery

  def update_last_visit
    cookies.permanent[:last_visit] = Time.now.utc
    logger.info("you printed")
  end

end
