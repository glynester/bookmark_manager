require 'spec_helper'

feature 'Sign up' do
  scenario 'create a new user account' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, bob@bobross.com!')
    expect(User.first.email).to eq('bob@bobross.com')
  end
end
