get "/surveys/new" do
  erb :'surveys/_survey_form'
end

post "/surveys/create" do
  params[:survey]
  survey = current_user.surveys.create(params[:survey])
  redirect "/"
end

get '/surveys/questions/new' do
  erb :'surveys/_question_form', layout: false
end

get '/surveys/questions/options/new' do
  erb :'surveys/_option_form', layout: false
end
