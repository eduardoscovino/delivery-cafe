require_relative 'cafe'
require_relative 'cafes_view'

class CafesController
  def initialize(cafe_repo)
    @cafe_repo = cafe_repo
    @cafes_view = CafesView.new
  end

  def add(cafe)
    nome = @cafes_view.pergunta_usuario(:nome)
    intensidade = @cafes_view.pergunta_usuario(:intensidade)
    preco - @cafes_view.pergunta_usuario(:preco)
    novo_cafe = Cafe.new(nome: nome, intensidade: intensidade, preco: preco)
    @cafe_repo.create(novo_cafe)
    @cafes_view.avisa_novo_cafe_adicionado
    display_cafes
  end

  def list
    display_cafes
  end

  private

  def display_cafes
    cafes = @cafe_repo.all
    @cafes_view.display(cafes)
  end
end
