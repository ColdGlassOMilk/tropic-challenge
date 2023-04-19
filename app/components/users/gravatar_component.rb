# frozen_string_literal: true

class Users::GravatarComponent < ViewComponent::Base
  def initialize(user:, size: 40)
    @user = user
    @size = size
  end

  private

  def user_hash
    Digest::MD5.hexdigest @user.email.downcase
  end

  def image_url
    "https://www.gravatar.com/avatar/#{user_hash}?s=#{@size}&d=identicon"
  end
end
