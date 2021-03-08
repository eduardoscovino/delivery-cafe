class SessoesView
  def pede_coisa(coisa)
    puts "#{coisa}"
    puts "> "
    gets.chomp
  end

  def mostra_mensagem_erro
    puts "Credenciais inválidas. Tente novamente"
  end

  def display(empregados)
    empregados.each_with_index do |empregado, index|
      puts "#{index + 1} - #{empregado.usuario}"
    end
  end
end