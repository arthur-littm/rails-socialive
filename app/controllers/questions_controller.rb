class QuestionsController < ApplicationController
  def create
    @question = Question.new(question_params)
    @livestream = Livestream.find(params[:livestream_id])
    @question.livestream = @livestream
    @question.user = current_user
    @question.save
    redirect_to livestream_path(@livestream)
  end

  private

  def question_params
    params.require(:question).permit(:inquiry)
  end
end
