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

  it 'saves a password recover token time when we generate a token' do
    Timecop.freeze do
      user.generate_token
      expect(user.password_token_time).to eq Time.now
    end
  end

  it 'can find a user with a valid token' do
     user.generate_token
     expect(User.find_by_valid_token(user.password_token)).to eq user
  end

  it 'cannot find a user with a token over 1 hour in the future' do
    user.generate_token
    Timecop.travel(60 * 60 +1) do
      expect(User.find_by_valid_token(user.password_token)).to eq nil
    end
  end
end
