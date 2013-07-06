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


get '/surveys/:id/show' do |id|
  @survey = Survey.find(id)
  @graph_data = []
  @survey.questions.each do |question|
    responses_array = []
    choices = []
    question.answers.each do |answer|
      responses_array << Response.where(answer_id: answer.id).count
      choices << answer.choice
    end
    @graph_data << {data: responses_array, title: question.question, choices:  choices}
  end
  @graph_data = @graph_data.to_json
  erb :"surveys/show"
end
