# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:attributes) do
    {
      first_name: 'Bruce',
      last_name: 'Wayne',
      email: 'batman@wayne.org'
    }
  end

  subject(:user) { User.new(attributes) }

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'is not valid without an email' do
    attributes[:email] = ''
    expect(user).not_to be_valid
  end

  it 'is not valid when email contains blacklisted domain' do
    attributes[:email] = 'blacklisted@gmail.com'
    expect(user).not_to be_valid
  end

  it 'is not valid when email is formatted incorrectly' do
    attributes[:email] = 'not_a_valid_email.com'
    expect(user).not_to be_valid
  end

  context 'when email already exists' do
    before { User.create(attributes) }

    it 'is not valid' do
      expect(user).not_to be_valid
    end
  end
end
