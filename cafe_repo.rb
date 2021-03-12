require "csv"
require_relative "cafe"

class CafeRepo
  def initialize(csv_file)
    @csv_file = csv_file
    @cafes = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def create(cafe)
    cafe.id = @next_id
    @cafes << cafe
    @next_id += 1
    save_csv
  end

  def all
    @cafes
  end
  
  def find_by_nome(nome)
    @cafes.find { |cafe| cafe.nome == nome }
  end

  def find(id)
    @cafes.find { |cafe| cafe.id == id }
  end

  private

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << %w[id nome intensidade preco]
      @meals.each do |meal|
        csv << [cafe.id, cafe.nome, cafe.intensidade, cafe.preco]
      end
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:preco] = row[:preco].to_i
      @cafes << Cafe.new(row)
    end
    @next_id = @cafes.last.id + 1 unless @cafes.empty?
  end

end