class Favour < ActiveRecord::Base
  belongs_to :user
  has_many :requests
  has_many :comments
  has_one :grade
  default_scope -> {order("created_at desc")}
end
