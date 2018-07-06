class FollowingService
  def initialize(current_user)
    @current_user = current_user
  end

  def following
    data.map do |follow|
      Followed.new(follow)
    end
  end

  private
  def conn
    Faraday.new("https://api.github.com")
  end

  def response
    conn.get "/user/following" do |req|
      req.params["access_token"] = @current_user.oauth_token
    end
  end

  def data
    JSON.parse(response.body, symbolize_names: true)
  end
end
