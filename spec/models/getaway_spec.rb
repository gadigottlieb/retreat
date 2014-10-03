require 'rails_helper'

describe Getaway do
  let(:tester) { User.create!(email: 'test@example.com', password: 'qwertyui', image_url: 'blah', password_confirmation: 'qwertyui', first_name: 'tester', last_name: 'one') }
  let(:getaway) { Getaway.create!(date: 1.day.from_now, place_id: 1, user_id: 1) }

  it { is_expected.to validate_presence_of(:departure_date) }
  it { is_expected.to validate_presence_of(:user_id) }

  it { is_expected.to validate_numericality_of(:user_id).is_greater_than(0) }
end
