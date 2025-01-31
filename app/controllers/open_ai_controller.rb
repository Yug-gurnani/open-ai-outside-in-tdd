class OpenAiController < ApplicationController
  def chat_gpt_response
    render json: {}, status: :ok
  end
end
