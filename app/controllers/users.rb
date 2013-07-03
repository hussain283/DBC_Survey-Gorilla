#----------- USERS -----------

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

get '/users/:id/show' do |id|
  @user = User.find(id)
  erb :'users/show'
end

get '/users/:id/posts' do |id|
  @user = User.find(id)
  erb :'users/posts'
end

get '/users/:id/comments' do |id|
  @user = User.find(id)
  erb :'users/comments'
end

get '/users/:id/delete' do
  User.delete(params[:id])
  redirect "/"
end
