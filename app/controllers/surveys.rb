get "/surveys/new" do
  erb :'surveys/_survey_form'
end

post "/surveys/create" do
  survey = current_user.surveys.create(params[:survey])
  content_type :json
  survey.id.to_json
end

get '/surveys/questions/new' do
  erb :'surveys/_question_form', layout: false
end

post '/surveys/questions/create' do
  question = Question.create(params[:question])
  question.id.to_json
end

get '/surveys/questions/options/new' do
  erb :'surveys/_option_form', layout: false
end

post '/surveys/questions/options/create' do
  answer = Answer.create(params[:answer])
end
