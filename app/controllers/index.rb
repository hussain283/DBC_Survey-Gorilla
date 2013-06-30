get '/' do
  # render home page
 #TODO: Show all users if user is signed in
  @users = User.all
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page 
  erb :sign_in
end

post '/sessions' do
  # sign-in
  @user = User.authenticate(params[:email],params[:password])
  if @user
    session[:user_id] = @user.id
    redirect "/"
  else
    erb :sign_in
  end
end

delete '/sessions/:id' do
  # sign-out -- invoked via AJAX
  session[:user_id] = nil
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  @user = User.new
  erb :sign_up
end

post '/users' do
  # sign-up a new user
  @user = User.new(params[:user])
  p @user
  if @user.valid?
    @user.save
    session[:user_id] = @user.id
    p session
    redirect "/"
  else
    erb :sign_up
  end
end

get '/user/:id/delete' do
  User.delete(params[:id])
  redirect "/"
end