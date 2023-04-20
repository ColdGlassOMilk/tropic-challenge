# frozen_string_literal: true

class ToastComponent < ViewComponent::Base
  def initialize(title:, icon: nil)
    @title = title
    @icon = icon
  end
end
