require 'rails_helper'

RSpec.describe OpenAiController, type: :controller do
  it "should return a 200 status code" do
    get :chat_gpt_response
    expect(response).to have_http_status(200)
  end
end
