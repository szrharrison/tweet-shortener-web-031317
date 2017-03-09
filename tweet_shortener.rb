# Write your code here.
def dictionary
  dictionary = {
    ['hello'] => 'hi',
    ['to', 'two', 'too'] => '2',
    ['for', 'four'] => '4',
    ['be'] => 'b',
    ['you'] => 'u',
    ['at'] => '@',
    ['and'] => '&'
  }
end
def dictionary_updater( word, short_word, dictionary = dictionary )
  if dictionary.value?( short_word )
    dictionary.each do |words, short_words|
      if short_words == short_word
        words << word
      end
    end
  elsif word
    dictionary[word] = short_word
  end
  dictionary
end

def word_substituter( tweet )
  short_tweet = tweet
  dictionary.each do |long_array, short_word|
    long_array.each do |long_word|
      short_tweet = short_tweet.gsub( /(\W)#{long_word}(\W)/i, "\\1#{short_word}\\2" )
    end
  end
  short_tweet
end

def bulk_tweet_shortener( tweets_array )
  tweets_array.each do |tweet|
    puts word_substituter( tweet )
  end
end

def selective_tweet_shortener( tweet )
  return_tweet = tweet
  if tweet.length > 140
    return_tweet = word_substituter( tweet )
  end
  return_tweet
end

def shortened_tweet_truncator( tweet )
  return_tweet = selective_tweet_shortener( tweet )
  if return_tweet.length > 140
    return_tweet = return_tweet[0,137] + '...'
  end
  return_tweet
end
