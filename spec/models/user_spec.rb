describe User do

  let!(:user) do
    User.create(email: 'glenn@freshstart.com',
                password: 'lovinit',
                password_confirmation: 'lovinit')
  end

  it 'authenicates user sign in' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate a user sign in given an incorrect password' do
    expect(User.authenticate(user.email, 'suhfaisudghus')).to be_nil
  end

  it 'saves a password recover token when we generate a token' do
    expect{user.generate_token}.to change{user.password_token}
  end
end
