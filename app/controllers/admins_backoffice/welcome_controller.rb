class AdminsBackoffice::WelcomeController < AdminsBackofficeController
  def index
    @total_questions = AdminStatistic.total_questions
    @total_users = AdminStatistic.total_users
  end
end
