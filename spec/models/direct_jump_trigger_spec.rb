require 'rails_helper'

RSpec.describe DirectJumpTrigger, type: :model do
  describe "#get_next_frame" do
    let(:condition) {
      %Q{
        {
          "jumps": [
            {
              "option_code": "correct_option",
              "frame_code": "correct_frame"
            },
            {
              "option_code": "other_option",
              "frame_code": "other_frame"
            }
          ]

        }
      }
    }
    let(:trigger) { DirectJumpTrigger.new condition: condition }
    let(:session) { GameSession.new }
    subject{ trigger.get_next_frame(session) }
    before do
      expect(session).to receive(:find_last_answer).and_return(correct_option)
    end
    describe 'for "correct_option"' do
      let(:correct_option) { Option.new code: 'correct_option' }
      it{ is_expected.to eq 'correct_frame' }
    end

    describe 'for "other_option"' do
      let(:correct_option) { Option.new code: 'other_option' }
      it{ is_expected.to eq 'other_frame' }
    end

    describe 'for not existing option' do
      let(:correct_option) { Option.new code: 'fake_option' }
      it{ expect{subject}.to raise_error }
    end
  end
end
