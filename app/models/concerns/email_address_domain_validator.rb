# frozen_string_literal: true

#
# Validates email address does not contain blacklisted domains
#
# @note Model must contain email field
#
class EmailAddressDomainValidator < ActiveModel::Validator

  # @example
  #   validates_with EmailAddressDomainValidator, exclude: %w[gmail.com hotmail.com yahoo.com]
  # @param exclude [Array<String>] List of domains to blacklist
  def validate(record)
    return unless options[:exclude]&.include? record.email.downcase.split('@').last

    record.errors.add :base, 'Domain is not permitted'
  end
end
