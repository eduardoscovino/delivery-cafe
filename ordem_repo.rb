require "csv"
require_relative "ordem"

class OrdemRepo
  def initialize(csv_file, cafe_repo, cliente_repo, empregado_repo)
    @csv_file = csv_file
    @ordens = []
    @cafe_repo = cafe_repo
    @cliente_repo = cliente_repo
    @empregado_repo = empregado_repo
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def create(ordem)
    ordem.id = @next_id
    @ordens << ordem
    @next_id += 1
    save_to_csv 
  end

  def ordens_nao_entregues
    @ordens.reject { |ordem| ordem.entregue? }
  end

  def marcar_entregue(ordem)
    ordem.entregue!
    save_to_csv
  end

  def minhas_ordens_nao_entregues(empregado)
    @ordem.select { |ordem| ordem.empregado == empregado }
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:entregue] = row[:entregue] == "true"
      row[:cafe] = @cafe_repo.find(row[:cafe_id].to_i)
      row[:cliente] = @cliente_repo.find(row[:cliente_id].to_i)
      row[:empregado] = @empregado_repo.find(row[:empregado_id].to_i)
      @ordens << Ordem.new(row)
    end
    @next_id = @ordens.last.id + 1 unless @ordens.empty?
  end

  def save_to_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << %w[id entregue cafe_id cliente_id empregado_id]
      @ordens.each do |ordem|
        csv << [ordem.id, ordem.entregue?, ordem.cafe.id, ordem.cliente.id, ordem.empregado.id]
      end
    end
  end
end
