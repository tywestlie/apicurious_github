require 'rails_helper'

describe 'it can log in' do
  it 'can log in wit github oauth' do
    stub_omniauth
    
    visit root_path
    expect(page).to have_link("Login With Github")
    click_link "Login With Github"
    expect(page).to have_link("Logout")
    expect(page).to have_css(".user-thumbnail")
  end
end
