# frozen_string_literal: true

# User
class User < ApplicationRecord
  # @return [Numeric] Flag set to send invitation email for new records
  attr_accessor :send_invite

  validates_with EmailAddressDomainValidator, exclude: %w[gmail.com hotmail.com yahoo.com]
  validates :email, presence: true, uniqueness: { case_sensitive: false },
                    format: { with: /(.+)@(.+)/, message: 'format must be valid' }

  before_save :send_invite_email, if: :send_invite?

  # @return [String] Formatted display name, concats First + Last, or First 2 email chars
  def display_name
    return email[0, 2].upcase unless first_name.present? && last_name.present?

    "#{first_name} #{last_name}".titleize
  end

  def send_invite_email
    return if EmailService.call(to_address: email, subject: '🌴 Welcome to Tropic!', body: 'Welcome!')

    errors.add :base, 'An error occurred while sending invite email'
    throw :abort
  end

  private

  # @return [Boolean] Send invitation email for new records
  def send_invite?
    send_invite == '1'
  end
end
