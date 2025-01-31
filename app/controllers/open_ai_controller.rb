class OpenAiController < ApplicationController
  def chat_gpt_response
    return render json: { error: "Prompt is required" }, status: :unprocessable_entity if params[:prompt].blank?

    response = OpenAiService.new(params[:prompt]).chat_gpt_response

    render json: {response: response}
  end
end
