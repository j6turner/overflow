class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.create(question_params)
    if @question.save
      flash[:notice] = "Thank you. Your very intelligent question has been posted."
      redirect_to '/'
    else
      flash[:alert] = "You have failed to complete your question form. Try again."
      redirect_to :back
    end
  end

private
  def question_params
    params.require(:question).permit(:title, :content)
  end

end
