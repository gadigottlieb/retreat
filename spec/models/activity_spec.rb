require 'rails_helper'

describe Activity do
  it { is_expected.to belong_to(:getaway) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:category) }
  it { is_expected.to validate_presence_of(:getaway_id) }
end
