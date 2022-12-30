-- Exercício 1:
-- a) Selecione todas as colunas e linhas da tabela de produtos.
SELECT * FROM banco.produtos;
-- b) Agora selecione apenas as colunas Nome_Produto, Marca_Produto e Preco_Unit.
SELECT Nome_Produto, 
	   Marca_Produto,
       Preco_Unit
FROM banco.produtos;
-- Renomeie essas colunas para Nome do Produto, Marca e Preço Unitário.
SELECT Nome_Produto AS 'Nome do Produto', 
	   Marca_Produto AS 'Marca',
       Preco_Unit AS 'Preço Unitário'
FROM banco.produtos;
-- c) Selecione as 5 primeiras linhas da tabela de lojas (considere todas as colunas).
SELECT * 
FROM banco.lojas
LIMIT 5;

-- Exercício 2:
-- a) Faça uma consulta na tabela de lojas e ordene a tabela de acordo 
-- com a coluna de Num_Funcionarios, em ordem crescente.
-- Obs: Sua consulta deve retornar as colunas de Loja (AS 'Nome da Loja'), Endereco (AS
-- 'Endereço'), Num_Funcionarios (AS 'Qtd. Funcionários') e Telefone (AS 'Número para contato').
SELECT Loja AS 'Nome da Loja',
	   Endereco AS 'Endereço',
       Num_Funcionarios AS 'Qtd. Funcionários',
       Telefone AS 'Número para contato'
FROM banco.lojas
ORDER BY Num_Funcionarios ASC;
-- b) Faça uma cosulta na tabela de clientes, ordenando a tabela de acordo com o nome
-- (ordem alfabética) e sobrenome (ordem alfabética). Retorne todas as colunas e linhas da tabela.
SELECT * FROM banco.clientes
ORDER BY Nome, Sobrenome ASC; 

-- Exercício 3:
-- a) Faça um filtro na tabela de produtos e retorne apenas os produtos com custo 
-- maior ou igual a 200.
SELECT * FROM banco.produtos
WHERE Custo_unit >= 200;
-- b) Faça um filtro na tabela de produtos e retorne apenas os produtos da marca "DELL"
SELECT * FROM banco.produtos
WHERE Marca_Produto = 'DELL';

-- Exercício 4:
-- a) Descubra o total de custo da tabela de pedidos.
SELECT SUM(Custo_Venda) AS 'Total de Custo de Venda',
       SUM(Custo_Unit) AS 'Total de Custo Unitário'
FROM banco.pedidos;
-- b) Descubra a quantidade total de lojas.
SELECT COUNT(Loja)
FROM banco.lojas;
-- c) Descubra o custo médio dos produtos (de acordo com a tabela de produtos).
SELECT AVG(Custo_Unit) 
FROM banco.produtos;
-- d) Descubra a quantidade mínima e máxima de funcionários das lojas (faça isso em um único SELECT).
SELECT 
MIN(Num_Funcionarios) AS 'Qtd. Mínima de Funcionários',
MAX(Num_Funcionarios) AS 'Qtd. Máxima de Funcionários'
FROM banco.lojas;

-- Exercício 5:
-- a) Faça um agrupamento para descobrir o total de clientes por Sexo.
SELECT 
	Sexo, 
	COUNT(Nome) AS 'Qtd. Clientes por Sexo'
FROM banco.clientes
GROUP BY Sexo;

-- b) Faça um agrupamento para descobrir quantos produtos existem por categoria.
SELECT Categoria, COUNT(*) AS 'Qtd. Produtos'
FROM banco.produtos
INNER JOIN categorias 
	  ON banco.produtos.ID_Categoria = banco.categorias.ID_Categoria
GROUP BY Categoria
ORDER BY Categoria DESC;

-- c) Faça um agrupamento para descobrir a soma total de receita por Loja.
SELECT Loja, 
		SUM(Receita_Venda) AS 'Receita Total',
        SUM(Custo_Venda) AS 'Custo Total'
FROM banco.pedidos
INNER JOIN lojas
		ON banco.pedidos.ID_Loja = banco.lojas.ID_Loja
GROUP BY Loja;

-- USE banco;
