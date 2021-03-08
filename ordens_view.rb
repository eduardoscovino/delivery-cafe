class OrdensView
  def display(ordens)
    ordens.each_with_index do |ordem, index|
      puts "#{index + 1}. #{ordem.empregado.usuario} tem que entregar #{ordem.cafe.nome} para #{ordem.cliente.nome}"
    end
  end

  def pergunta_index_para_usuario
    puts "Index"
    p "> "
    gets.chomp.to_i - 1
  end
end