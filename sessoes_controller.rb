require_relative 'sessoes_view'

class SessoesController
  def initialize(empregado_repo)
    @empregado_repo = empregado_repo
    @sessoes_view = SessoesView.new
  end

  def login
    usuario = @sessoes_view.pede_coisa(:usuario)
    senha = @sessoes_view.pede_coisa(:senha)
    empregado = @empregado_repo.find_by_usuario(usuario)
    return empregado if empregado && empregado.senha == senha
    
    @sessoes_view.mostra_mensagem_erro
    # recursivo
    login
  end
end