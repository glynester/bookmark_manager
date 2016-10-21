class BookmarkManager < Sinatra::Base
  get '/users/reset_password' do
    @user = User.find_by_valid_token(params[:token])
    if(@user)
      "Please enter your new password"
    else
      "Your token is invalid"
    end
  end
end
