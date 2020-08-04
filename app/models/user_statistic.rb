class UserStatistic < ApplicationRecord
  belongs_to :user

  # Virtual Attributes
  def total_questions
    right_questions + wrong_questions
  end

  # Class Method
  def self.set_statistic(answer, current_user)
    if !!current_user
      user_statistic = UserStatistic.find_or_create_by(user: current_user)
      if answer.correct?
        user_statistic.right_questions += 1
      else
        user_statistic.wrong_questions += 1
      end
      user_statistic.save
    end
  end
end
