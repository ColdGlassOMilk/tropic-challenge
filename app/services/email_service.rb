class EmailService
  private_class_method :new

  class << self
    def call(to_address:, subject:, body:)
      true
    end
  end
end
