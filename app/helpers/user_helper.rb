# frozen_string_literal: true

module UserHelper
  def date_joined(id)
    User.find(id).created_at.strftime('%Y-%m-%d')
  end

  def last_signed_in(id)
    User.find(id).last_sign_in_at.strftime('%Y-%m-%d %k:%M')
  end
end
