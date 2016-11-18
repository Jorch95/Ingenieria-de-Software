class Favour < ActiveRecord::Base
  belongs_to :user
  has_many :requests
  has_many :comments
  has_one :grade

  scope :provincia, -> (provincia) { where provincia: provincia }
  scope :titulo, -> (titulo) { where titulo: titulo }
  scope :descripcion, -> (descripcion) { where "favours.descripcion like ?", "%" + descripcion + "%" }
  scope :ciudad, -> (ciudad) { where ciudad: ciudad }
  scope :descendente, -> {order("fecha desc")}
  scope :ascendente, -> {order("fecha asc")}

end
