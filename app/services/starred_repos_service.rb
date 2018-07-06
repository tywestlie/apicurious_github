class StarredReposService
  def initialize(current_user)
    @current_user = current_user
  end

  def starred_repos
    data.map do |repo|
      StarredRepo.new(repo)
    end
  end

  private
  def conn
    Faraday.new("https://api.github.com")
  end

  def response
    conn.get "/user/starred" do |req|
      req.params["access_token"] = @current_user.oauth_token
    end
  end

  def data
    JSON.parse(response.body, symbolize_names: true)
  end
end
