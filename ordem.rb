class Ordem
  attr_accessor :id, :entregue
  attr_reader :cafe, :empregado, :cliente

  def initialize(attributes = {})
    @id = attributes[:id]
    @cafe = attributes[:cafe]
    @empregado = attributes[:empregado]
    @cliente = attributes[:cliente]
    @entregue = attributes[:entregue] || false
  end

  def entregue?
    @entregue
  end

  def entregue!
    @entregue = true
  end
end
