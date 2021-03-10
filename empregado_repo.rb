require 'csv'
require_relative 'empregado'

class EmpregadoRepo
  def initialize(csv_file)
    @csv_file = csv_file
    @empregados = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def create(empregado)
    empregado.id = @next_id
    @empregados << empregado
    @next_id += 1
    save_csv
  end

  def all
    @empregados
  end

  def all_entregadores
    @empregados.select { |empregado| empregado.funcao == "entregador" }
  end

  def find_by_usuario(usuario)
    @empregados.find { |empregado| empregado.usuario == usuario}
  end

  def find(id)
    @empregados.find { |empregado| empregado.id == id }
  end

  private

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << %w[id nome usuario senha funcao]
      @empregados.each do |empregado|
        csv << [empregado.id, empregado.nome, empregado.usuario, empregado.senha, empregado.funcao]
      end
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      @empregados << Empregado.new(row)
    end
    @next_id = @empregados.last.id + 1 unless @empregados.empty?
  end
end