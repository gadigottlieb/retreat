require 'rails_helper'

describe User do
  let(:tester) { User.create!(email: 'test@example.com',
                              password: 'qwertyui',
                              image_url: 'blah',
                              password_confirmation: 'qwertyui',
                              first_name: 'tester',
                              last_name: 'one') }

  it { expect(tester).to be_valid }

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email) }

  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to validate_presence_of(:password_confirmation) }
  it { is_expected.to ensure_length_of(:password).is_at_least(8) }
  it { is_expected.to have_secure_password }

  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
end
