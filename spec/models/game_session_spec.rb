require 'rails_helper'

RSpec.describe GameSession, type: :model do
  it { is_expected.to validate_presence_of :survey }
end
