require 'rails_helper'

RSpec.describe Survey, type: :model do
  it { is_expected.to validate_presence_of :title }
end
