# frozen_string_literal: true

module UserHelper
  def date_joined(id)
    User.find(id).created_at.strftime('%Y-%m-%d')
  end

  def last_online(id)
    User.find(id).last_active_at.strftime('%Y-%m-%d %k:%M')
  end

  def user_level_color(id)
    if User.find(id).admin?
      'admin-color'
    elsif User.find(id).mod?
      'mod-color'
    elsif User.find(id).public_relations?
      'pr-color'
    else
      'user-color'
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
