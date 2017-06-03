get '/login' do # '/sessions/new'
 erb :'/sessions/new'
end

post '/login' do # '/sessions'
  @user = User.find_by(email_address: params[:email])

  if @user && @user.authenticate?(params[:password])
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = ["Incorrect username or password"]
    erb :'/sessions/new'
  end
end

def logout
  session[:id] = nil
  redirect '/login'
end

get '/logout' do
  logout
end

delete '/login' do  # '/sessions'
  logout
end
