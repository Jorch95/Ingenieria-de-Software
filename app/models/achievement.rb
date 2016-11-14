class Achievement < ActiveRecord::Base
  has_many :users
  validates_uniqueness_of :titulo
  validates :rango_inferior, numericality:{only_integer:true}
  validates :rango_superior, numericality:{only_integer:true}
  validates_presence_of :titulo, :descripcion, :rango_inferior, :rango_superior
  validate :correct_range_format?
  validate :is_in_range?

  def correct_range_format?
    if errors[:rango_inferior].empty? && errors[:rango_superior].empty?

      if self.rango_inferior>=self.rango_superior
        errors.add :rango_inferior, "tiene que ser menor que el rango superior"
      end
    end
  end

  def is_in_range?
    if errors[:rango_inferior].empty? && errors[:rango_superior].empty?
      Achievement.where(enable: true).where.not(id: self.id).each do |a|
        if self.rango_inferior>=a.rango_inferior && self.rango_inferior<=a.rango_superior
          errors.add :rango_inferior, "se solapa con el de otros logros"
          return
        elsif self.rango_superior>=a.rango_inferior && self.rango_superior<=a.rango_superior
          errors.add :rango_superior, "se solapa con el de otros logros"
          return
        end
      end
    end
  end
end
