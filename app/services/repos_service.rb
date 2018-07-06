class ReposService
  def initialize(current_user)
    @current_user = current_user
  end

  def repos
    data.map do |repo|
      Repo.new(repo)
    end
  end

  private
  def conn
    Faraday.new("https://api.github.com")
  end

  def response
    conn.get "/user/repos" do |req|
      req.params["access_token"] = @current_user.oauth_token
    end
  end

  def data
    JSON.parse(response.body, symbolize_names: true)
  end
end
