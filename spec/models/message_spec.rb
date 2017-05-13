require 'rails_helper'
describe Message do
  let(:message) = FactorrGirl.build(:message)
  describe '#create' do
    it "is valid with a body" do
     expect(message).to be_valid
    end

    it "is invalid without a body" do
     message[:body] = ""
     message.valid?
     expect(message.errors[:body]).to include("を入力してください")
    end

  end
end