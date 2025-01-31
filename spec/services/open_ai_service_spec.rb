require 'rails_helper'

RSpec.describe OpenAiService, type: :service do
  let(:main_prompt) { "Write 'Hello World' without the quotes" }
  let(:expected_output) { "Hello World" }

  it "should return an error when no prompt is passed" do
    expect { described_class.new }.to raise_error(StandardError)
  end

  it "should return a response when a prompt is passed" do
    expect(described_class.new("Write Hello without quotes").chat_gpt_response).to eq("Hello")
  end

  it "should return expected_output when main_prompt is passed" do
    expect(described_class.new(main_prompt).chat_gpt_response).to eq(expected_output)
  end
end
