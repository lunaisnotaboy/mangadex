# frozen_string_literal: true

module ApplicationHelper
  def icon(style, name, text = nil, html_options = {})
    if text.is_a?(Hash)
      html_options = text
      text = nil
    end

    content_class = "#{style} fa-#{name}"
    content_class << " #{html_options[:class]}" if html_options.key?(:class)
    html_options[:class] = content_class

    html = tag.i(nil, html_options)
    html << ' ' << text.to_s if text.present?
    html
  end

  def current_page(page_name)
    if @page == page_name
      'active'
    else
      ''
    end
  end

  def display_alert(type, strong, text)
    "<div class=\"alert alert-#{type} text-center\" role=\"alert\"><strong>#{strong}:</strong> #{text}</div>".html_safe
  end

  def current_commit
    ENV['CURRENT_COMMIT'].to_s
  end

  def current_commit_full
    ENV['CURRENT_COMMIT_LONG'].to_s
  end

  def github_url
    "https://github.com/lunaisnotaboy/mangadex/tree/#{current_commit_full}"
  end

  def display_avatar(username, id, fit = nil, resize = nil, width = 512, height = 512)
    if resize.present?
      image_tag(User.find(id).avatar.derivation_url(:thumbnail, width, height), alt: username, title: username,
                                                                                class: "rounded-circle #{fit.present? ? 'avatar-fit' : 'avatar'} my-2 ml-2")
    else
      image_tag(User.find(id).avatar_url, alt: username, title: username,
                                          class: "rounded-circle #{fit.present? ? 'avatar-fit' : 'avatar'} my-2 ml-2")
    end
  end
end
