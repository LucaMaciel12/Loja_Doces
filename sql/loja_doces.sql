--criando o banco de dados loja de doces
create database loja_doces;

--abrindo o banco de dados loja de doces
use loja_doces;

--criando a tabela de usuários
create table tab_usuarios(
	id_usuario int primary key identity,
	login varchar (20) not null,
	senha varchar (100) not null,
	palavra_chave varchar (15) not null
);

--criando a tabela de funcionário
create table tab_funcionarios(
	id_funcionario int primary key identity,
	id_usuario int not null,
	nome varchar (25) not null,
	email varchar (30) not null,
	cpf varchar (25) not null,
	rg varchar (25) not null, 
	telefone varchar (15) not null,
	status int not null,

	constraint fk_funcionario_usuario
	foreign key (id_usuario)
	references tab_usuarios(id_usuario)
);
 
--criando a tabela de clientes
create table tab_clientes(
	id_cliente int primary key identity,
	id_usuario int not null,
	nome varchar (25) not null,
	email varchar (30) not null,
	telefone varchar (15) not null,
	dtnasc date not null,

	constraint fk_cliente_usuario
	foreign key (id_usuario)
	references tab_usuarios(id_usuario)
);

-- criando a tabela de fornecedores 
create table tab_fornecedores(
	id_fornecedor int primary key identity,
	id_funcionario int not null,
	nome varchar (20) not null,
	data_entrega date not null,
	quantidade int not null,

	constraint fk_funcionario_fornecedor
	foreign key (id_funcionario)
	references tab_funcionarios (id_funcionario)
);

--criando a tabela de produtos
create table tab_produtos(
	id_produto int primary key identity,
	id_fornecedor int not null,
	nome varchar (10) not null,
	quantidade int not null,
	valor decimal (10, 2) not null,
	descricao varchar (20) not null,
	data_vencimento date not null,

	constraint fk_fornecedor_produto
	foreign key (id_fornecedor)
	references tab_fornecedores (id_fornecedor)
);

--criando a tabela de pedidos
create table tab_pedidos(
	id_pedido int primary key identity,
	id_cliente int not null,
	id_funcionario int not null,
	data date not null,
	total decimal (10, 2),

	constraint fk_cliente_pedido
	foreign key (id_cliente)
	references tab_clientes (id_cliente),

	constraint fk_funcionario_pedido
	foreign key (id_funcionario)
	references tab_funcionarios(id_funcionario)
);
 
 --criando a tabela de itens do pedidos
 create table tab_itens_pedido(
	 id_item int primary key identity,
	 id_pedido int not null,
	 id_produto int not null,
	 valor decimal(10,2) not null,
	 quantidade int not null,
	 subtotal decimal (10,2),

	 constraint fk_pedido_itens_pedido
	 foreign key (id_pedido)
	 references tab_pedidos (id_pedido),

	 constraint fk_produto_itens_pedido
	 foreign key (id_produto)
	 references tab_produtos(id_produto)
 );

--inserindo na tabela de usuarios
insert into tab_usuarios(login, senha, palavra_chave) values
('admin', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'padrão'),
('suadmin', 'b3a8e0e1f9ab1bfe3a36f231f676f78bb30a519d2b21e6c530c0eee8ebb4a5d0', 'padrão'),
('comum', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'padrão'),
('comum', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'padrão'),
('comum', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'padrão');

--inserindo na tabela de funcionários
insert into tab_funcionarios(id_usuario, nome, email, cpf, rg, telefone, status) values 
(3, 'João da Silva', 'joao@gmail.com', '418178832-67', '61998114-3', '(11) 9211-72918', 1);

--inserindo na tabela de clientes
insert into tab_clientes(id_usuario, nome, email, telefone, dtnasc)values
(4, 'Maria Santos','maria@outlook.com', '(12) 9221-6240', '2000-09-29' ),
(5, 'Mateus Nascimento', 'mateus@hotmail.com', '(17) 9276-1222', '1999-02-12');

--inserindo na tabela de fornecedores
insert into tab_fornecedores(id_funcionario, nome, data_entrega, quantidade)values
(1, '7belo', '2026-07-10', 10),
(1, 'Deliket', '2026-07-10', 10),
(1, 'Kibon', '2026-07-15', 20);

--inserindo na tabela de produtos
insert into tab_produtos(id_fornecedor, nome, quantidade,valor, descricao, data_vencimento) values
(1, 'Pirulito', 10, 3.5, 'Sabor Framboesa', '2028-02-10'),
(2, 'Jujuba', 10, 2.00, 'Bala de goma','2029-03-05'),
(3, 'Chocolate', 20, 7.00,  'Branco meio amargo', '2027-12-09');

--inserindo na tabela de pedidos
insert into tab_pedidos(id_cliente, id_funcionario, data) values
(1,1, '2026-03-26'),
(2,1, '2026-04-10');

--inserindo na tabela de itens do pedido
insert into tab_itens_pedido(id_pedido, id_produto,quantidade, valor, subtotal)values
(1, 2, 5,2.00, 10),
(2,1,3,3.5,10.5),
(2,3,2,7,14);
