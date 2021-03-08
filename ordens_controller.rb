require_relative "cafes_view"
require_relative "clientes_view"
require_relative "sessoes_view"
require_relative "ordens_view"
require_relative "ordem"

class OrdensController
  def initialize(cafe_repo, cliente_repo, empregado_repo, ordem_repo)
    @cafe_repo = cafe_repo
    @cliente_repo = cliente_repo
    @empregado_repo = empregado_repo
    @ordem_repo = ordem_repo
    @cafes_view = CafesView.new
    @clientes_view = ClientesView.new
    @sessoes_view = SessoesView.new
    @ordens_view = OrdensView.new
  end

  # adicionar nova ordem de servico
  def add
    cafe = selecionar_cafe
    cliente = selecionar_cliente
    empregado = selecionar_empregado
    ordem = Ordem.new(cafe: cafe, cliente: cliente, empregado: empregado)
    @ordem_repo.create(ordem)
  end

  def listar_pedidos_nao_entregues
    nao_entregues = @ordem_repo.ordens_nao_entregues
    @ordens_view.display(nao_entregues)
  end

  def listar_minhas_ordens(usuario_momento)
    pedidos_nao_entregues(usuario_momento)
  end

  def marcar_como_entregue(usuario_momento)
    pedidos_nao_entregues(usuario_momento)
    index = @ordens_view.pergunta_index_para_usuario
    minhas_ordens = @ordem_repo.minhas_ordens_nao_entregues(usuario_momento)
    ordem = minhas_ordens[index]
    @ordem_repo.marcar_entregue(ordem)
  end

  private

  def selecionar_cafe
    cafes = @cafe_repo.all
    @cafes_view.display(cafes)
    index = @ordens_view.pergunta_index_para_usuario
    return cafes[index]
  end

  def selecionar_cliente
    clientes = @cliente_repo.all
    @clientes_view.display(clientes)
    index = @ordens_view.pergunta_index_para_usuario
    return clientes[index]
  end

  def selecionar_empregado
    empregados = @empregado_repo.all_entregadores
    @sessoes_view.display(empregados)
    index = @ordens_view.pergunta_index_para_usuario
    return empregados[index]
  end

  def pedidos_nao_entregues(usuario)
    ordens = @ordem_repo.minhas_ordens_nao_entregues(usuario)
    @ordens_view.display(ordens)
  end
end