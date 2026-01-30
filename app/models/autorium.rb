class Autorium < ApplicationRecord

  belongs_to :titulo
  belongs_to :autor

  validates :titulo, presence: true
  validates :autor, presence: true

  scope :recentes, -> { order(created_at: :desc) }


  def descricao_completa
    "#{titulo.titulo} - #{autor.nome}"
  end

  def self.buscar_por_titulo_e_autor(palavra_titulo, nome_autor)
    joins(:titulo, :autor)
      .where("titulos.titulo LIKE ? AND autors.nome LIKE ?", "%#{palavra_titulo}%", "%#{nome_autor}%")
  end
end
