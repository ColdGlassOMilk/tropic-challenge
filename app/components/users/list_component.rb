# frozen_string_literal: true

class Users::ListComponent < ViewComponent::Base
  def initialize(users:)
    @users = users
  end
end
