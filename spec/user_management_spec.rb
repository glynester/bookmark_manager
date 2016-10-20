require 'spec_helper'

feature 'Sign up' do
  scenario 'create a new user account' do
    expect { sign_up_right }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, bob@bobross.com!')
    expect(User.first.email).to eq('bob@bobross.com')
  end
  scenario 'password mismatch' do
    expect{ sign_up_wrong }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Passwords do no match, please try again'
  end
end
