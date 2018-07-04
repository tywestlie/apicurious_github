class DashboardController < ApplicationController
   def show
     response = Faraday.get("https://api.github.com/users/#{current_user.username}/repos?access_token=#{current_user.oauth_token}")

     @repos = JSON.parse(response.body)
  end
end
