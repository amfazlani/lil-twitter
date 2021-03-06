class User < ActiveRecord::Base
has_many :user_retweets
has_many :user_followers
has_many :tweets
has_many :followers, through: :user_followers, source: :follower
has_many :retweets, through: :user_retweets, source: :retweet

  def self.authenticate(username, password)
    @user = self.find_by(username: username)
    if @user
      if @user.password == password
        return @user
      end
    end
    return nil
  end

end
