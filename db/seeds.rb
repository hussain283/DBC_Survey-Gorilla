require 'faker'

# create a few users

#TODO: Once you have implemented BCrypt - you can use these to seed your database.


# User.create :name => 'Dev Bootcamp Student', :email => 'me@example.com', :password => 'password'
# 5.times do
#   User.create :name => Faker::Name.name, :email => Faker::Internet.email, :password => 'password'
# end


Survey.create(title: "Test Survery", user_id: 1)

Question.create(question: "What do you like best about DBC?", survey_id: 1)
Answer.create(choice:"Coding errday", question_id: 1)
Answer.create(choice:"No TEACHERS", question_id: 1)
Answer.create(choice:"Drinking beer", question_id: 1)
Answer.create(choice:"Strawberry margaritas", question_id: 1)

Question.create(question: "Who is the best cohort at DBC?", survey_id: 1)
Answer.create(choice:"FLIZZARDS", question_id: 2)
Answer.create(choice:"La la la lizzards", question_id: 2)
Answer.create(choice:"Fence lizzards", question_id: 2)
Answer.create(choice:"Sexy cohort", question_id: 2)



