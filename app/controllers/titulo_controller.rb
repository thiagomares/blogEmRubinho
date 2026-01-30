class TituloController < ApplicationController
  def index
    @titulos = Titulo.all

    render :json => @titulos
  end

  # com este método, eu consigo buscar um título específico pelo id
  def show
    @titulo = Titulo.find(params[:id])

    render :json => @titulo.resumo
  end

  def create
    @titulo = Titulo.new(titulo_params)

    if @titulo.save
      render :json => @titulo, status: :created
    else
      render :json => @titulo.errors, status: :unprocessable_entity
    end
  end

  def buscar_por_titulo
    @titulos = Titulo.buscar_por_titulo(params[:palavra])

    render :json => @titulos
  end

  def buscar_por_data
    @titulos = Titulo.buscar_por_data(params[:data])

    render :json => @titulos
  end

  def ultima_publicacao
    publicacao = Titulo.ultima_publicacao_geral
    render :json => { ultima_publicacao: publicacao }
  end

  private

  def titulo_params
    params.require(:titulo).permit(:titulo, :corpo)
  end

  def params_permitidos
    params.permit(:palavra, :data)
  end
end