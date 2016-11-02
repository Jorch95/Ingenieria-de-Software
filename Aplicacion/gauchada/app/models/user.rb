class User < ActiveRecord::Base
  has_one :achievement
  has_many :purchases
  has_many :favours
  has_many :requests
end
