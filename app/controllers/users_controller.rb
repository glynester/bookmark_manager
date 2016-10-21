class BookmarkManager < Sinatra::Base
  get '/users/reset_password' do
    @user = User.find_by_valid_token(params[:token])
    if(@user)
      "Please enter your new password"
    else
      "Your token is invalid"
    end
  end
  
  post '/users/recover' do
    user = User.first(email: params[:email])
    if user
      user.generate_token
      SendRecoverLink.call(user)
    end
    erb :'users/acknowledgment'
  end
end
