def sign_up_wrong
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: 'bob@bobross.com'
  fill_in :password, with: 'password1'
  fill_in :password_confirmation, with: 'password2'
  click_button 'Sign up'
end

def sign_up_right
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: 'bob@bobross.com'
  fill_in :password, with: 'password1'
  fill_in :password_confirmation, with: 'password1'
  click_button 'Sign up'
end

def sign_up_nil
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: nil
  fill_in :password, with: 'password1'
  fill_in :password_confirmation, with: 'password1'
  click_button 'Sign up'
end

def sign_up_invalid
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: 'invalid@email'
  fill_in :password, with: 'password1'
  fill_in :password_confirmation, with: 'password1'
  click_button 'Sign up'
end

def sign_in(email:, password:)
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign in'
end
