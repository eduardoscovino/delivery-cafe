# delivery-cafe
 
No Café Delivery, é possível logar como operador ou entregador, e naturalmente, as funções possuem privilégios diferentes. O delivery gira em torno das ordens de serviço para entrega das cápsulas de café na casa dos clientes. Tendo isso em mente, são necessários os seguintes modelos:

 •	Cliente: id, nome e endereço
 
 •	Café: id, nome, intensidade e preço
 
 •	Empregado: id, nome, usuário, senha, função
 
 •	Ordem: id, entregue (boolean), cliente, café, empregado
 
 
 
O app começa com um login, que pode ser feito por um operador ou entregador. A partir daí, surgem dois cenários:

•	Login do operador: pode adicionar novos clientes, cafés e ordens, além de conseguir listar todo o repositório disponível dos mesmos.

•	Login do entregador: pode listar as ordens ainda não entregues e mudar a variável para “entregue” caso o pedido tenha sido concluído.
