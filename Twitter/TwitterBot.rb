#
# Twitter Favorite Bot
# => Favorite all of your users tweets automatically(then delete them if you want)
#
######################

require 'OAuth'
require 'json'
require 'pry'

#consumer_token and secret "yg4sUAHIYX8azG4c6a4w" , "b1R2WnBQMF2RsQVyy9lYaPsuWCHjHuawjStMYGQEV0Q"

class TwitterBot

  attr_reader :token, :url

  def initialize(oauth_token, oauth_token_secret, consumer_token, consumer_secret)
    @token = prepare_access_token(oauth_token, oauth_token_secret, consumer_token, consumer_secret)
    @url = "http://api.twitter.com/"

  end


  def prepare_access_token(oauth_token, oauth_token_secret, consumer_token, consumer_secret)
    consumer = OAuth::Consumer.new(consumer_token,consumer_secret,
        {
          :site => "http://api.twitter.com",
          :scheme => :header
    })

    token_hash = {
      :oauth_token => oauth_token,
      :oauth_token_secret => oauth_token_secret
    }

    access_token = OAuth::AccessToken.from_hash(consumer,token_hash)
    return access_token

  end

  def user_info(name)

    timeline = @token.request(:get, "#{@url}1.1/statuses/user_timeline.json?screen_name=#{name}&count=1")
    results = JSON.parse(timeline.body)
    info = {
      user_id: results[0]['user']['id'],
      tweets: results[0]['user']['statuses_count']
    }

  end

  def fav(id)
    post_hash = {'id' => id}
    @token.post("#{@url}1.1/favorites/create.json", post_hash)
  end

  def favorite_timeline(name,count,pages,speed=1.00)
    tweets = []
    (1..(pages)).each do |page|
      timeline = @token.request(:get,"#{@url}1.1/statuses/user_timeline.json?screen_name=#{name}&count=#{count}&page=#{page}")
      tweets = JSON.parse(timeline.body)
      tweets.each do |tweet|
        fav(tweet['id'])
        sleep speed
      end

    end
    tweets.collect{|tweet| tweet['id']}
  end

  def delete_favs(speed = 0.2, tweets)
    tweets.each do |tweet|
      @token.post("#{@url}1/favorites/destroy/#{tweet}.json")
      print '.'
      sleep speed
    end
  end

end



