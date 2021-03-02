class Cafe
  attr_accessor :id
  attr_reader :nome, :intensidade, :preco
  
  def initialize(attributes = {})
    @id = attributes[:id]
    @nome = attributes[:nome]
    @intensidade = attributes[:intensidade]
    @preco = attributes[:preco]
  end
end