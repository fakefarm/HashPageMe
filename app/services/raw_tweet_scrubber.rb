module RawTweetScrubber

  def hashtags(t)
    tags = t.hashtags.map { |h| h.attrs[:text] }.join(",")
    if tags.present?
      tags
    else
      ""
    end
  end

  def image_url(t)
    if t.media.present?
      t.media.first.media_url_https.to_s
    else
      ""
    end
  end
end
