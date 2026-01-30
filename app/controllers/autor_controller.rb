class AutorController < ApplicationController
  def index
    @autores = Autor.all

    render :json => @autores.map(&:descricao_completa)
  end

  def show
    @autor = Autor.find(params[:id])

    render :json => @autor.descricao_completa
  end

  def create
    @autor = Autor.new(autor_params)

    if @autor.save
      render :json => @autor, status: :created
    else
      render :json => @autor.errors, status: :unprocessable_entity
    end
  end

  def update
    @autor = Autor.find(params[:id])

    if @autor.update(autor_params)
      render :json => @autor
    else
      render :json => @autor.errors, status: :unprocessable_entity
    end
  end

  def ultima_publicacao
    @autor = Autor.find(params[:id])
    titulo = @autor.ultima_publicacao
    render :json => { ultima_publicacao: titulo }
  end

  def ultimas_publicacoes_geral
    @autores = Autor.all.map do |autor|
      {
        id: autor.id,
        nome: autor.name,
        email: autor.email,
        local: autor.local,
        ultima_publicacao: autor.ultima_publicacao
      }
    end
    render :json => @autores
  end

  private

  def autor_params
    params.require(:autor).permit(:nome)
  end
end
