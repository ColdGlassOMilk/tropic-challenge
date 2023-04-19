# frozen_string_literal: true

class EmailAddressDomainValidator < ActiveModel::Validator
  def validate(record)
    return unless options[:exclude]&.include? record.email.downcase.split('@').last

    record.errors.add :base, 'Domain is not permitted'
  end
end
