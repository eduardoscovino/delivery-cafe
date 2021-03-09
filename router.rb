class Router
  def initialize(cafes_controller, clientes_controller, sessoes_controller, ordens_controller)
    @cafes_controller = cafes_controller
    @clientes_controller = clientes_controller
    @sessoes_controller = sessoes_controller
    @ordens_controller = ordens_controller
    @running = true
  end

  def run
    while @running
      @usuario_momento = @sessoes_controller.login
      while @usuario_momento
        if @usuario_momento.operador?
          route_acao_operador
        else
          route_acao_entregador
        end
      end
      print `clear`
    end
  end

  private

  def route_acao_operador
    mostrar_menu_operador
    opcao = gets.chomp.to_i
    print `clear`
    acao_operador(opcao)
  end

  def route_acao_entregador
    mostrar_menu_entregador
    opcao = gets.chomp.to_i
    print `clear`
    acao_entregador(opcao)
  end

  def mostrar_menu_operador
    puts "--------------------"
    puts "------- MENU -------"
    puts "--------------------"
    puts "1. Adicionar novo café"
    puts "2. Listar cafés"
    puts "3. Adicionar novo cliente"
    puts "4. Listar clientes"
    puts "5. Adicionar nova ordem"
    puts "6. Listar ordens não entregues"
    puts "7. Logout"
    puts "8. Sair"
    print "> "
  end

  def print_rider_menu
    puts "--------------------"
    puts "------- MENU -------"
    puts "--------------------"
    puts "1. Listar minhas ordens não entregues"
    puts "2. Marcar ordem como entregue"
    puts "3. Logout"
    puts "4. Sair"
    print "> "
  end

  def acao_operador(opcao)
    case choice
    when 1 then @cafes_controller.add
    when 2 then @cafes_controller.list
    when 3 then @clientes_controller.add
    when 4 then @clientes_controller.list
    when 5 then @orders_controller.add
    when 6 then @orders_controller.listar_pedidos_nao_entregues
    when 7 then logout!
    when 8 then stop!
    else puts "Tente novamente..."
    end
  end

  def acao_entregador(opcao)
    case choice
    when 1 then @ordens_controller.listar_minhas_ordens(@usuario_momento)
    when 2 then @ordens_controller.marcar_como_entregue(@usuario_momento)
    when 3 then logout!
    when 4 then stop!
    else puts "Tente novamente..."
    end
  end

  def logout!
    @usuario_momento = nil
  end

  def stop!
    logout!
    @running = false
  end
end