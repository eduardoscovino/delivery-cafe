class Cliente
  attr_accessor :id
  attr_reader :nome, :endereco
  
  def initialize(attributes = {})
    @id = attributes[:id]
    @nome = attributes[:nome]
    @endereco = attributes[:endereco]
  end
end