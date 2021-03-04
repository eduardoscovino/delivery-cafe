require_relative 'cliente'
require_relative 'clientes_view'

class ClientesController
  def initialize(cliente_repo)
    @cliente_repo = cliente_repo
    @clientes_view = ClientesView.new
  end

  def add(cliente)
    nome = @clientes_view.pergunta_usuario(:nome)
    endereco = @clientes_view.pergunta_usuario(:endereco)
    novo_cliente = Cliente.new(nome: nome, usuario: usuario)
    @cliente_repo.create(novo_cliente)
    @clientes_view.avisa_novo_cliente_adicionado
    display_clientes
  end

  def list
    display_clientes
  end

  private

  def display_clientes
    clientes = @cliente_repo.all
    @clientes_view.display(clientes)
  end
end
