require 'spec_helper'

describe HomeController do

  describe "GET 'index'" do
    it "returns http success" do
      request.cookies['last_visit'] = Time.now.utc.to_s
      get 'index'
      response.should be_success
    end
  end

end
