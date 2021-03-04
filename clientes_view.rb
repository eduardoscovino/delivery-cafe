class ClientesView
  def pergunta_usuario(coisa)
    puts "#{coisa.capitalize}?"
    p "> "
  end

  def avisa_novo_cliente_adicionado
    puts "Novo cliente adicionado com sucesso"
  end

  def display(clientes)
    clientes.each_with_index do |cliente, index|
      puts "#{index + 1}. #{cliente.nome} - #{cliente.endereco}"
    end
  end

end