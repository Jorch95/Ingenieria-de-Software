class Favour < ActiveRecord::Base
  belongs_to :user
  has_many :requests, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :grade

  scope :provincia, -> (provincia) { where provincia: provincia }
  scope :user_id, -> (user_id) { where user_id: user_id }
  scope :titulo, -> (titulo) { where "favours.titulo like ?", "%" + titulo + "%" }
  scope :descripcion, -> (descripcion) { where "favours.descripcion like ?", "%" + descripcion + "%" }
  scope :ciudad, -> (ciudad) { where ciudad: ciudad }
  scope :ordenadoPor, -> (campo,criterio) {order(campo + " " + criterio)}
  scope :ordenadoPorDefault, -> {order("titulo asc")}

end
