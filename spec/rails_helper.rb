
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!


  config.filter_rails_from_backtrace!

end

def stub_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
    provider: 'github',
    uid: 3247116,
    info: {
      nickname: 'tywestlie',
      name: 'Tyler Westlie'
    },
    credentials: {
      token: ENV["github_test_token"]
    },
    extra: {
      raw_info:{
        avatar_url: 'https://avatars0.githubusercontent.com/u/32471176?v=4'
      }
    }
    })
end
