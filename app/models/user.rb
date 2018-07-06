class User < ApplicationRecord
  def self.from_omniauth(auth_info)
    user =find_or_create_by(uid: auth_info[:uid]) do | new_user |
      new_user.uid            = auth_info.extra.raw_info.id
      new_user.name           = auth_info.extra.raw_info.name
      new_user.username       = auth_info.extra.raw_info.login
      new_user.oauth_token    = auth_info.credentials.token
      new_user.avatar_url     = auth_info.extra.raw_info.avatar_url
    end
    user.update(username: auth_info.extra.raw_info.login, avatar_url: auth_info.extra.raw_info.avatar_url, oauth_token: auth_info.credentials.token)
    user
  end
end
