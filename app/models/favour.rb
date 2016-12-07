class Favour < ActiveRecord::Base
  belongs_to :user
  has_many :requests, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :grade
  validate :image_correct?
  validate :provincias

  scope :provincia, -> (provincia) { where provincia: provincia }
  scope :user_id, -> (user_id) { where user_id: user_id }
  scope :titulo, -> (titulo) { where "favours.titulo like ?", "%" + titulo + "%" }
  scope :descripcion, -> (descripcion) { where "favours.descripcion like ?", "%" + descripcion + "%" }
  scope :ciudad, -> (ciudad) { where ciudad: ciudad }
  scope :ordenadoPor, -> (campo,criterio) {order(campo + " " + criterio)}
  scope :ordenadoPorDefault, -> {order("titulo asc")}
  scope :image, -> (image_url) { where "favours.image_url like ?", "%" + '.com' + "%" }

  def image_correct?
    if self.image_url.blank?
      self.image_url="http://gdurl.com/GY5O"
    else
        if !self.image_url.include? ".com"
          errors.add :image_url, "tiene que ser una URL para poder subir la foto"
        end
    end
  end

  def provincias
    cant = 0
    provincias_validas = ['Buenos Aires', 'Tucuman', 'Chaco', 'Neuquen', 'Rio Negro',
    'Chubut', 'Santa Cruz', 'Santa Fe', 'Cordoba', 'Tierra del Fuego',
    'San Luis', 'Mendoza', 'Catamarca', 'San Juan', 'Entre Rios', 'Corrientes',
    'Misiones', 'Formosa', 'Salta', 'Jujuy', 'Santiago del Estero', 'La Rioja', 'La Pampa']
    provincias_validas.each do |prov|
      if self.provincia != prov
        cant +=1
      end
      if cant == 23
        errors.add :provincia, "no es una provincia dentro de Argentina"
      end
    end
  end

  #def puntos?
  #  if self.user_id.puntaje <= 0
  #    errors.add :user_id, "necesita mas puntos para poder publicar."
  #  end
  #end
end
