class GitHubUser
  def initialize(current_user)
    @current_user = current_user
  end

  def repos
    ReposService.new(@current_user).repos
  end

  def starred_repos
    StarredReposService.new(@current_user).starred_repos
  end

  def following
    FollowingService.new(@current_user).following
  end

  def followers
    FollowerService.new(@current_user).followers
  end
end
