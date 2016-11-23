class Request < ActiveRecord::Base
  belongs_to :user
  belongs_to :favour
  validate :is_in_range?

  def is_in_range?
    if Time.now.to_i>self.fecha.to_time.to_i
      errors.add :fecha,""
    end
  end
end
