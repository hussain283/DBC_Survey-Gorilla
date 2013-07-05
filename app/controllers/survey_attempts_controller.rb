get '/:token' do |token|
  @survey = Survey.find_by_token(token)
  erb :"surveys/attempt"
end


post '/survery_attempt' do
  survey_attempt = SurveyAttempt.create(survey_id: params[:survey_id])
  params[:response].each do |question_id, answer_id|
    Response.create(question_id: question_id, answer_id: answer_id, survey_attempt_id: survey_attempt.id)
  end
  redirect '/'
end
