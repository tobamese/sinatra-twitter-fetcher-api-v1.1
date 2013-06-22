require 'sinatra'
require 'sinatra/jsonp'
require 'rubygems'
require 'twitter'

class TwitterFetcher < Sinatra::Base
  helpers Sinatra::Jsonp

  @@twitter_client = Twitter::Client.new(
    :consumer_key       => 'Xne96VDhbghcGKjOlx4hXQ',
    :consumer_secret    => 'JYal9zB8eHFzRBPn2zsOKeg0TYPo3RUXnyuHclpWHA',
    :oauth_token        => '38320634-DIMp3eaSl9e1vQJM2UjJBdBkeEnvVR1iHEgX8yWM',
    :oauth_token_secret => 'ftXE4cN7RF1tUCUYRO6MCUDX2iypBbDLyQWaZeNXzQ',
  )

  get '/' do
    jsonp @@twitter_client.home_timeline.map(&:attrs)
  end

end
