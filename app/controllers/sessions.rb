#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page 
  erb :'sessions/sign_in'
end

post '/sessions' do
  # sign-in
  @user = User.authenticate(params[:email],params[:password])
  if @user
    session[:user_id] = @user.id
    redirect "/"
  else
    erb :'sessions/sign_in'
  end
end

delete '/sessions/:id' do
  # sign-out -- invoked via AJAX
  session[:user_id] = nil
end
