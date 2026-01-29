class AutorController < ApplicationController
  def index
    @autores = Autor.all

    render :json => @autores
  end

  def show
    @autor = Autor.find(params[:id])

    render :json => @autor
  end

  def create
    @autor = Autor.new(autor_params)

    if @autor.save
      render :json => @autor, status: :created
    else
      render :json => @autor.errors, status: :unprocessable_entity
    end
  end

  private

  def autor_params
    params.require(:autor).permit(:nome)
  end
end
