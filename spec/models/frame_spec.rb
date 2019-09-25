require 'rails_helper'

RSpec.describe Frame, type: :model do
  subject { build :frame }
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :survey }
  it { is_expected.to validate_presence_of :code }
  it { is_expected.to validate_uniqueness_of(:code).scoped_to(:survey_id) }
end
