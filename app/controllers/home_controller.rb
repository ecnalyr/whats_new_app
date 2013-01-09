class HomeController < ApplicationController
  after_filter :update_last_visit
end
