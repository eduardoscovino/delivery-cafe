class CafesView
  def pergunta_usuario(coisa)
    puts "#{coisa.capitalize}?"
    p "> "
  end

  def avisa_novo_cafe_adicionado
    puts "Novo café adicionado com sucesso"
  end

  def display(cafes)
    cafes.each_with_index do |cafe, index|
      puts "#{index + 1}. #{cafe.nome} / Intensidade: #{cafe.intensidade} / Preço: #{cafe.preco}"
    end
  end

end