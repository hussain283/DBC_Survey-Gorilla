get '/' do
  if logged_in?
    redirect "/users/dashboard"
  else
  	@surveys = Survey.all
    erb :index
  end
end
