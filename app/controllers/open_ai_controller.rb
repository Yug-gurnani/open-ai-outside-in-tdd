class OpenAiController < ApplicationController
  before_action :check_prompt, only: :chat_gpt_response

  def chat_gpt_response
    response = OpenAiService.new(params[:prompt]).chat_gpt_response

    render json: { response: response }
  end

  private

  def check_prompt
    if params[:prompt].blank?
      render json: { error: "Prompt is required" }, status: :unprocessable_entity
    end
  end
end
