get '/users/new' do
  # render sign-up page
  @user = User.new
  erb :'sessions/sign_up'
end

post '/users' do
  # sign-up a new user
  @user = User.new(params[:user])
  p @user
  if @user.valid?
    @user.save
    session[:user_id] = @user.id
    redirect "/"
  else
    erb :'sessions/sign_up'
  end
end

get '/users/dashboard' do
  erb :index
end