require "twitter"

client = Twitter::REST::Client.new do |config|
  config.consumer_key           = ""
  config.consumer_secret        = ""
  config.access_token           = ""
  config.access_token_secret    = ""
end

loop do
client.home_timeline(count: 200, include_rts: false).each do |timeline|
  # timeline.idを格納する配列
  tl_id = []

  # 配列にすでにあるtimeline.idがあれば次へなければtl_idに格納
  if (tl_id.include?(timeline.id))
    next
  end
  tl_id << (timeline.id)

　# タイムラインにデレステという単語が見つかればリツイート
  if (/^(.*デレステ.*)$/) =~ timeline.text
    client.retweet(timeline.id) rescue nil
  end
end

sleep(60)

end
