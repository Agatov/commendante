module ApplicationHelper
  def stars_class_by_rate(rate)
    case rate
      when 1 then return "one-star"
      when 2 then return "two-stars"
      when 3 then return "three-stars"
      when 4 then return "four-stars"
      when 5 then return "five-stars"
    end
  end

  def decorate_text(str)
    ("<p>" + str.split("\n\n").join("</p><p>") + "</p>").html_safe
  end
end
