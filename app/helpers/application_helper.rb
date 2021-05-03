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
    `git rev-list HEAD --max-count=1 --abbrev-commit`.strip
  end
end
