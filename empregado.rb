class Empregado
  attr_accessor :id
  attr_reader :nome, :usuario, :senha, :funcao
  def initialize(attributes = {})
    @id = attributes[:id]
    @nome = attributes[:nome]
    @usuario = attributes[:usuario]
    @senha = attributes[:senha]
    @funcao = attributes[:funcao]
  end

  def operador?
    @funcao == "operador"
  end

  def entregador?
    @funcao == "entregador"
  end
end