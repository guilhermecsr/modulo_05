class Site::SearchController < SiteController
  def questions
    # params[:term]
    # @questions = Question.all
    @questions = Question.search(params[:page], params[:term])
  end
end
