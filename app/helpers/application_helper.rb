module ApplicationHelper

  def center(content = nil, &block)
    content = capture(&block).presence if block_given?
    content = content_tag(:div, content, :class => 'center') if content.present?
    block_given? ? concat(content) : content
  end

  def content_center(*args, &block)
    if block_given?
      concat center(content_block(capture(&block)))
    else
      center content_block(*args)
    end
  end

  def content_block(content = nil, &block)
    content = content_tag(:div, block_given? ? collect_content(&block) : content, :class => 'block')
    block_given? ? concat(content) : content
  end

  def collect_content(&block)
    capture(&block).presence
  end

end
