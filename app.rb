require_relative "cafe_repo"
require_relative "cafes_controller"
require_relative "cliente_repo"
require_relative "clientes_controller"
require_relative "empregado_repo"
require_relative "sessoes_controller"
require_relative "ordem_repo"
require_relative "ordens_controller"
require_relative "router"

CAFES_CSV_FILE = File.join(__dir__, "cafes.csv")
CLIENTES_CSV_FILE = File.join(__dir__, "clientes.csv")
EMPREGADOS_CSV_FILE = File.join(__dir__, "empregados.csv")
ORDENS_CSV_FILE = File.join(__dir__, "ordens.csv")

cafe_repo = CafeRepo.new(CAFES_CSV_FILE)
cafes_controller = CafesController.new(cafe_repo)

cliente_repo = ClienteRepo.new(CLIENTES_CSV_FILE)
clientes_controller = ClientesController.new(cliente_repo)

empregado_repo = EmpregadoRepo.new(EMPREGADOS_CSV_FILE)
sessoes_controller = SessoesController.new(empregado_repo)

ordem_repo = OrdemRepo.new(ORDENS_CSV_FILE, cafe_repo, cliente_repo, empregado_repo)
ordens_controller = OrdensController.new(cafe_repo, cliente_repo, empregado_repo, ordem_repo)

router = Router.new(cafes_controller, clientes_controller, sessoes_controller, ordens_controller)
router.run