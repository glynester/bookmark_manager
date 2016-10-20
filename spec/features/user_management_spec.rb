feature 'User sign up' do
  scenario 'I can sign up as a new user' do
  expect { sign_up }.to change(User, :count).by(1)
  expect(page).to have_content('Welcome, alice@example.com')
  expect(User.first.email).to eq('alice@example.com')
  end
end

feature 'User sign up' do
  scenario 'rejects the user if confirmation password does not match' do
    expect { sign_up(password_confirmation: 'wrong_password') }.not_to change(User, :count)
  end
end

feature 'User sign up' do
  scenario 'adds the user if matching confirmation password' do
    expect { sign_up }.to change(User, :count).by(1)
  end
end
