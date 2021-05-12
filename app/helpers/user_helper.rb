# frozen_string_literal: true

module UserHelper
  def date_joined(id)
    User.find(id).created_at.strftime('%Y-%m-%d')
  end

  def last_signed_in(id)
    User.find(id).last_sign_in_at.strftime('%Y-%m-%d %k:%M')
  end

  def user_level_color(id)
    if User.find(id).admin?
      'f54242'
    elsif User.find(id).mod?
      'f5ce42'
    elsif User.find(id).public_relations?
      '4287f5'
    else
      '000'
    end
  end

  def user_level(id)
    if User.find(id).admin?
      'Admin'
    elsif User.find(id).mod?
      'Moderator'
    elsif User.find(id).public_relations?
      'Public Relations'
    else
      'User'
    end
  end
end
