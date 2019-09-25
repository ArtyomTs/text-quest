require 'rails_helper'

RSpec.describe Option, type: :model do
  subject { build :option }
  it { is_expected.to validate_presence_of :text }
  it { is_expected.to validate_presence_of :frame }
  it { is_expected.to validate_presence_of :code }
  it { is_expected.to validate_uniqueness_of(:code)
                        .scoped_to(:frame_id)
                        .with_message("You need an unique option code to navigate.") }
end
