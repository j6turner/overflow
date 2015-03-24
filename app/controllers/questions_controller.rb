class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @response = Response.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.create(question_params)
    @question.update(user_id: current_user.id)
    if @question.save
      flash[:notice] = "Thank you. Your very intelligent question has been posted."
      redirect_to '/'
    else
      flash[:alert] = "You have failed to complete your question form. Try again."
      redirect_to :back
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:notice] = "Your question has been updated."
      redirect_to question_path(@question)
    else
      flash[:alert] = "You've completely failed. Try again."
      redirect_to :back
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:notice] = "Your question is lost to the abyss."
    redirect_to '/'
  end

private
  def question_params
    params.require(:question).permit(:title, :content, :best_response_id)
  end

end
