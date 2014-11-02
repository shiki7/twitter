require "twitter"

#ruby fav_auto.rb [user] [遡りツイート数] [間隔]

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ""
  config.consumer_secret     = ""
  config.access_token        = ""
  config.access_token_secret = ""
end

num =20 #デフォルト遡りツイート数
interval=0 #間隔

user = ARGV[0] if ARGV[0]
num = ARGV[1] if ARGV[1]
interval = ARGV[1] if ARGV[2]
target_list=[]

#favするターゲットツイートを取得 (リプは弾く)
client.user_timeline(user, options={count:num}).each do |tweet|
  target_list.push("#{tweet.id}") if !"#{tweet.text}".index("@") 
end

p '遡り数='+num.to_s
p 'ふぁぼ数='+target_list.length.to_s

#ふぁぼを実行
target_list.each do |target|
  client.favorite(target)
  sleep interval.to_i
end

