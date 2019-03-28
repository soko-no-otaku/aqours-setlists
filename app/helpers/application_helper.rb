module ApplicationHelper
  def days_ago_in_words(past_time)
    today = Date.today
    past_date = past_time.to_date

    "#{(today - past_date).to_i}日前"
  end

  def period_in_words(start_date, end_date)
    raw([start_date, end_date].uniq.map do |date|
      l date, format: :short
    end.join('～<br>'))
  end

  def tweet_button(tweet_text)
    %Q(<a href="https://twitter.com/share?ref_src=twsrc%5Etfw" class="twitter-share-button" data-lang="ja" data-show-count="false" data-text="#{tweet_text}">Tweet</a><script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>).html_safe
  end
end
