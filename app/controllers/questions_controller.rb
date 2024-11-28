class QuestionsController < ApplicationController
  def index
    # @questions = Question.where[user_id: current_user.id]
    @questions = current_user.questions
    @question = Question.new
  end

  def create
    @questions = current_user.questions
    @question = Question.new(question_params)
    @question.user = current_user
    if @question.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.append(:questions, partial: "questions/question",
            locals: { question: @question })
        end
        format.html { redirect_to questions_path }
      end
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def question_params
    params.require(:question).permit(:user_question)
  end
end