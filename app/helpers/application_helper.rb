module ApplicationHelper
  def icon(style, name, text = nil, html_options = {})
    text, html_options = nil, text if text.is_a?(Hash)

    content_class = "#{style} fa-#{name}"
    content_class << " #{html_options[:class]}" if html_options.key?(:class)
    html_options[:class] = content_class

    html = content_tag(:i, nil, html_options)
    html << ' ' << text.to_s unless text.blank?
    html
  end

  def current_page(page_name)
    if @page == page_name
      "active"
    else
      ""
    end
  end

  def display_alert(type, strong, text)
    "<div class=\"alert alert-#{type} text-center\" role=\"alert\"><strong>#{strong}:</strong> #{text}</div>".html_safe
  end
end
