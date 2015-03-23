class ResponsesController < ApplicationController


  def create
    @question = Question.find(params[:question_id])
    @response = @question.responses.create(response_params)
    if @response.save()
      flash[:notice] = "Your response has been posted."
      redirect_to question_path(@question)
    else
      flash[:alert] = "You have failed to complete this form."
      redirect_to :back
    end
  end

private

  def response_params
    params.require(:response).permit(:content, :question_id)
  end

end
