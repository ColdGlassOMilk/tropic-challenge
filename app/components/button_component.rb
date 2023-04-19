# frozen_string_literal: true

class ButtonComponent < ViewComponent::Base
  def initialize(label:, href: '#', id: nil, icon: nil)
    @label = label
    @href = href
    @id = id
    @icon = icon
  end
end
