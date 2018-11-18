require "twitter"

#ex)ruby null-reply.rb hoge 5 

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ""
  config.consumer_secret     = ""
  config.access_token        = ""
  config.access_token_secret = ""
end
# tweet
if defined?(ARGV[0])
  user_id= ARGV[0]
  user_id="@"+user_id+" "
end
if defined?(ARGV[1])
  if (/^[+-]?[0-9]+$/ =~ ARGV[1])
    count = ARGV[1]
  end
end
if defined?(user_id) && defined?(count)
  for i in 1..count.to_i do
    tweet_word= user_id * i
    #sleep 3
    client.update(tweet_word)
  end
end
