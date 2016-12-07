class Grade < ActiveRecord::Base
  belongs_to :user
  belongs_to :favour
  validates_presence_of :calificacion, :favour_id, :user_id
end
