require 'rails_helper'

describe 'user visits user dashboard' do
  it 'sees starred repos' do
    WebMock.allow_net_connect!
    user = User.create(uid: '1234567', username: 'manoj', name: 'Manjo', avatar_url: 'https://www.maxhealthcare.in/sites/default/files/doctors/doctor_photo/2018/May/15/Dr%20Manoj%20Kumar.jpg', oauth_token: ENV["github_test_token"])
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    url = "https://api.github.com/users/#{user.username}/starred?access_token=#{user.oauth_token}"

    response = File.read('./spec/fixtures/starred.json')

    stub_request(:get, url).to_return(status: 200, body: response)

    visit "/#{user.username}"

    expect(page).to have_content(user.username)
    WebMock.disable_net_connect!
  end
end
