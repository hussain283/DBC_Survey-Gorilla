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
  responses_array = []
  @survey.questions.first.answers.each do |answer|
    responses_array << Response.where(answer_id: answer.id).count
  end
  choices = @survey.questions.first.answers.map {|answer| answer.choice}
  @graph_data << {data: responses_array, title: @survey.questions.first.question, choices: choices}
  @graph_data << {data: responses_array, title: @survey.questions.first.question, choices: choices}


  @graph_data = @graph_data.to_json

  erb :"surveys/show"
end
