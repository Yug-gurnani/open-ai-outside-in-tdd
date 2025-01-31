class OpenAiService
  GPT_4_MODEL = "gpt-4o"

  attr_accessor :prompt, :open_ai_access_token

  def initialize(prompt)
    @prompt = prompt
    @open_ai_access_token = ENV["OPEN_AI_ACCESS_TOKEN"]
  end

  def chat_gpt_response
    response = client.chat(parameters: build_parameters)
    response["choices"][0]["message"]["content"]
  end

  def build_parameters
    {
      model: GPT_4_MODEL,
      messages: [
        { role: "user", content: prompt }
      ]
    }
  end

  def client
    @client ||= OpenAI::Client.new(access_token: open_ai_access_token)
  end
end
