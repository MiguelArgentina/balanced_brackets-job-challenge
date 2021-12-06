class TestController < ApplicationController
  def calculate
    return unless input_sent
    text = text_params
    if helpers.balanced_brackets?(text)
      flash[:notice] = "The text <strong> #{text} </strong> is balanced!"
    else
      flash[:alert] = "The text <strong> #{text} </strong> is not balanced"
    end
    redirect_to test_calculate_path
  end

  private
  def input_sent
    params[:text_to_process].present?
  end

  def text_params
    text_params = params.permit(:text_to_process)[:text_to_process]
  end
end
