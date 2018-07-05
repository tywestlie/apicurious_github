class DashboardController < ApplicationController
   def show

     response = Faraday.get("https://api.github.com/users/#{current_user.username}/starred?access_token=#{current_user.oauth_token}")
    @starred_repos = JSON.parse(response.body)

    response_2 = Faraday.get("https://api.github.com/users/#{current_user.username}/followers?access_token=#{current_user.oauth_token}")
    @followers = JSON.parse(response_2.body)

     response_3 = Faraday.get("https://api.github.com/users/#{current_user.username}/following?access_token=#{current_user.oauth_token}")

     @following = JSON.parse(response_3.body)
  end
end
