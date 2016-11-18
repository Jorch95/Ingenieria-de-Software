class Favour < ActiveRecord::Base
  belongs_to :user
  has_many :requests, dependent: :destroy
  has_many :comments
  has_one :grade

  scope :provincia, -> (provincia) { where provincia: provincia }
  scope :titulo, -> (titulo) { where titulo: titulo }
  scope :descripcion, -> (descripcion) { where "favours.descripcion like ?", "%" + descripcion + "%" }
  scope :ciudad, -> (ciudad) { where ciudad: ciudad }
  scope :descendente, -> {order("created_at desc")}
  scope :ascendente, -> {order("created_at asc")}

end
