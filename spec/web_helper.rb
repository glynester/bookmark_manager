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
