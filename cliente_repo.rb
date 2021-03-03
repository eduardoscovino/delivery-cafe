require 'csv'
require_relative 'cliente'

class ClienteRepo
  def initialize(csv_file)
    @csv_file = csv_file
    @clientes = []
    @next_id = 1
    load_csv
  end

  def create(cliente)
    cliente.id = @next_id
    @clientes << cliente
    @next_id += 1
    save_csv
  end

  def all
    @clientes
  end

  def find(id)
    @clientes.find { |cliente| cliente.id == id }
  end

  private

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << %w[id nome endereco]
      @clientes.each do |cliente|
        csv << [cliente.id, cliente.nome, cliente.endereco]
      end
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      @clientes << Cliente.new(row)
    end
    @next_id = @clientes.last.id + 1 unless @clientes.empty?
  end
end
