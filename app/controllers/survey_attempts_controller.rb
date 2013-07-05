get '/:token' do |token|
  @survey = Survey.find_by_token(token)
  erb :"surveys/attempt"
end


post '/survery_attempt' do
  p params
  p params[:survery_id]
  p params[:question]
  # SurveyAttempt.create(survey_id:)
end
