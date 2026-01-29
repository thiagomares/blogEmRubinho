class Titulo < ApplicationRecord

  # com isso aqui, eu garanto que o titulo e o corpo nao fiquem vazios
  validates :titulo, presence: true
  validates :corpo, presence: true

  scope :recentes, -> { order(created_at: :desc) }


  def resumo
    "#{titulo} - #{corpo.truncate(100)}"
  end

  def self.buscar_por_titulo(palavra)
    where("titulo LIKE ?", "%#{palavra}%")
  end

  def self.buscar_por_data(data)
    where("DATE(created_at) = ?", data)
  end



end
