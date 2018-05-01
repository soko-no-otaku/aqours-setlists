module ApplicationHelper
  def days_ago_in_words(past_time)
    today = Date.today
    past_date = past_time.to_date

    "#{(today - past_date).to_i}日前"
  end
end
