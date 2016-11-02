class Achievement < ActiveRecord::Base
    has_many :users
end
