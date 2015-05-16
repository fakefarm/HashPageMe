# _dw hmm this doesn't seem to be a service. this is something else, maybe a module.

module TweetParser
=begin

  blog: https://rubymonk.com/learning/books/4-ruby-primer-ascent/chapters/48-advanced-modules/lessons/117-included-and-extend

  two: http://ruby-doc.org/core-2.2.2/Module.html

  adding both class and object methods.
  this way would let you add both with 'include'
  rather than added include FOO and extend FOO::ClassMethods


    Person.find() # class context
    person.addresses.find(:blah) # object context

  module ClassMethods
  end

  def included(klass)
    klass.extend(TweetParser::ClassMethods)
  end
=end

  def tweet_with_proper_hashtag(ht)
    tweets_with_hashtags.select { |t| does_this_tweet_have_right_hashtag?(ht, t) }
  end

  def tweets_with_hashtags
    tweets.select { |t| t.hashtags.count > 0 }
  end


  def does_this_tweet_have_right_hashtag?(ht, tweet)
    tweet.hashtags.select{ |t| t.text == ht }.present?
  end
end
