class Autor < ApplicationRecord

  validates :name, presence: true
  validates :local, presence: true

  def descricao_completa
    "#{name} - #{local}"
  end

  def self.buscar_por_nome(nome)
    where("nome LIKE ?", "%#{nome}%")
  end
end
