class Grade < ActiveRecord::Base
  belongs_to :user
  belongs_to :favour
  validates_presence_of :favour_id, :user_id
  validates_inclusion_of :calificacion, in: [true, false]
end
