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
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'email is nil' do
    expect{ sign_up_nil }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Email must not be blank'
  end

  scenario 'I can\'t sign up with and invalid email address' do
    expect { sign_up_invalid }.to change(User, :count).by(0)
    expect(page).to have_content 'Email has an invalid format'
  end

  scenario 'I cannot sign up using an existing email address' do
    sign_up_right
    expect { sign_up_right }.to_not change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end
end
