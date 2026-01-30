class Autor < ApplicationRecord

  validates :name, presence: true
  validates :local, presence: true
  validates :email, presence: true

  def descricao_completa
    "#{name} - #{local} - #{email}"
  end

  def self.buscar_por_nome(nome)
    where("nome LIKE ?", "%#{nome}%")
  end

  def ultima_publicacao
    autorium = Autorium.joins(:titulo)
                       .order('titulos.created_at DESC')
                       .limit(1)
                       .first
    
    return nil unless autorium
    
    {
      titulo: autorium.titulo.titulo,
      corpo: autorium.titulo.corpo.truncate(100),
      data: autorium.titulo.created_at.strftime('%d-%m-%Y'),
      autor: name
    }
  end
end
