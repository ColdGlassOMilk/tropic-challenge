# frozen_string_literal: true

#
# Sends an email
#
class EmailService
  private_class_method :new

  class << self
    #
    # Send an email
    #
    # @example
    #   EmailService.call(to_address: 'user@example.com', subject: 'Test', body: 'Hello')
    #
    # @param [String] to_address Recipient email
    # @param [String] subject Email subject
    # @param [String] body Email body content
    #
    # @return [Boolean] Success
    #
    def call(to_address:, subject:, body:)
      true
    end
  end
end
