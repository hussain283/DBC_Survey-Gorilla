class CreateSurveys < ActiveRecord::Migration
  def change

    create_table :surveys do |t|
      t.string :title
      t.references :user
      t.timestamps
    end

    create_table :questions do |t|
      t.string :question
      t.references :survey
      t.timestamps
    end

    create_table :answers do |t|
      t.string :choice
      t.references :question
      t.timestamps
    end

    create_table :responses do |t|
      t.references :question
      t.references :answer
      t.references :survey_attempt
      t.timestamps
    end

    create_table :survey_attempts do |t|
      t.references :survey
      t.references :user
      t.timestamps
    end

  end
end
