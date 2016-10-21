require 'spec_helper'

feature 'Sign up' do
  scenario 'create a new user account' do
    expect { sign_up_right }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, bob@bobross.com')
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

feature 'User sign in' do

  let!(:user) do
    User.create(email: 'glenn@freshstart.com',
                password: 'lovinit',
                password_confirmation: 'lovinit')
  end

  scenario 'signing in with correct credentials' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end
end

feature 'User signs out' do

  before(:each) do
    User.create(email: 'test@test.com',
                password: 'test',
                password_confirmation: 'test')
  end

  scenario 'while being signed in' do
    sign_in(email: 'test@test.com', password: 'test')
    click_button 'Sign out'
    expect(page).to have_content('goodbye')
    expect(page).not_to have_content('Welcome, test@test.com')
  end

end

feature 'Resetting Password' do
 scenario 'When I forget my password I can see a link to reset' do
   visit '/sessions/new'
   click_link 'I forgot my password'
   expect(page).to have_content("Please enter your email address")
 end

 scenario 'When I enter my email I am told to check my inbox' do
    visit '/users/recover'
    fill_in :email, with: "alice@example.com"
    click_button "Submit"
    expect(page).to have_content "Thanks, Please check your inbox for the link."
  end



end
