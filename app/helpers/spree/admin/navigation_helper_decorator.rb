module Spree
  module Admin
    module NavigationHelper

      def link_to_with_icon(icon_name, text, url, options = {})
        options[:class] = (options[:class].to_s + " icon-link with-tip action-#{icon_name}").strip
        options[:class] += ' no-text' if options[:no_text]
        options[:title] = text if options[:no_text]
        text = options[:no_text] ? '' : raw("<span class='text'>#{text}</span>")
        text = text.gsub('\'', '"')
        options.delete(:no_text)
        if icon_name
          icon = content_tag(:span, '', class: "icon icon-#{icon_name}")
          text.insert(0, icon + ' ')
        end
        link_to(text.html_safe, url, options)
      end

    end
  end
end      