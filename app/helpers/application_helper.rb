# frozen_string_literal: true

# Parent class for helpers
module ApplicationHelper
  def error_messages(obj, field)
    html = +%()
    obj.errors.full_messages_for(field).each do |message|
      html << %(<span class="bg-warning border rounded-3 my-1">#{message}</span>)
    end
    html
  end
end
