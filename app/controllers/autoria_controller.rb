class AutoriaController < ApplicationController
  def index
    @autorias = Autorium.all

    render :json => @autorias
  end

  def show
    @autoria = Autorium.find(params[:id])

    render :json => @autoria
  end

  def create
    @autoria = Autorium.new(autoria_params)

    if @autoria.save
      render :json => @autoria, status: :created
    else
      render :json => @autoria.errors, status: :unprocessable_entity
    end
  end

  private

  def autoria_params
    params.require(:autoria).permit(:id_titulo, :id_autor)
  end
end
