class Tweet < ActiveRecord::Base
  self.establish_connection :tweet_development 
end
