require 'rails_helper'

RSpec.describe OpenAiController, type: :controller do
  it "should return a 200 status code" do
    get :chat_gpt_response, params: { prompt: "Hello" }
    expect(response).to have_http_status(200)
  end

  it "should return a error when prompt is not passed" do
    get :chat_gpt_response
    expect(response).to have_http_status(422)
  end

  it "should return a response if prompt is passed" do
    get :chat_gpt_response, params: { prompt: "Hello" }
    expect(JSON.parse(response.body)['response']).to eq("Hello")
  end
end
