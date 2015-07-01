class BasePresenter
  def hashtags
    tw = tweets.select do |t|
      t.hashtags =~ /h,/
    end
    tags = tw.map do |t|
      t.hashtags.split(',')[1].strip
    end
    tags.uniq - ['h']
  end
end
