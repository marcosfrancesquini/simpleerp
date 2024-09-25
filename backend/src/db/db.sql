CREATE DATABASE Maincrm;

USE Maincrm;

CREATE TABLE UserCRM (
    userId INT AUTO_INCREMENT PRIMARY KEY,
    userName VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phoneNumber VARCHAR(15) DEFAULT NULL,
    fiscalId VARCHAR(20) DEFAULT NULL,
    country VARCHAR(20) DEFAULT NULL,
    province VARCHAR(30) DEFAULT NULL,
    city VARCHAR(40) DEFAULT NULL,
    street VARCHAR(60) DEFAULT NULL,
    houseNumber VARCHAR(8) DEFAULT NULL,
    aditionalData VARCHAR(60) DEFAULT NULL,
    userType ENUM('Cliente', 'Fornecedor')
);


CREATE TABLE Produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL,
    categoria_id INT NOT NULL,
    FOREIGN KEY (categoria_id) REFERENCES Categorias(id)
);

CREATE TABLE Categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

-- Tabelas de transações
CREATE TABLE Vendas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    data_venda DATE,
    valor_total DECIMAL(10, 2),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(id)
);

CREATE TABLE ItensVenda (
    id INT AUTO_INCREMENT PRIMARY KEY,
    venda_id INT,
    produto_id INT,
    quantidade INT,
    preco_unitario DECIMAL(10, 2),
    FOREIGN KEY (venda_id) REFERENCES Vendas(id),
    FOREIGN KEY (produto_id) REFERENCES Produtos(id)
);

CREATE TABLE Compras (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fornecedor_id INT,
    data_compra DATE,
    valor_total DECIMAL(10, 2),
    FOREIGN KEY (fornecedor_id) REFERENCES Fornecedores(id)
);

CREATE TABLE ItensCompra (
    id INT AUTO_INCREMENT PRIMARY KEY,
    compra_id INT,
    produto_id INT,
    quantidade INT,
    preco_unitario DECIMAL(10, 2),
    FOREIGN KEY (compra_id) REFERENCES Compras(id),
    FOREIGN KEY (produto_id) REFERENCES Produtos(id)
);

CREATE TABLE Pagamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    venda_id INT,
    data_pagamento DATE,
    valor DECIMAL(10, 2),
    metodo_pagamento VARCHAR(100),
    FOREIGN KEY (venda_id) REFERENCES Vendas(id)
);

CREATE TABLE Contas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(255),
    tipo ENUM('Receita', 'Despesa'),
    saldo DECIMAL(10, 2)
);

CREATE TABLE MovimentacoesFinanceiras (
    id INT AUTO_INCREMENT PRIMARY KEY,
    conta_id INT,
    data_operacao DATE,
    valor DECIMAL(10, 2),
    descricao TEXT,
    tipo ENUM('Credito', 'Debito'),
    FOREIGN KEY (conta_id) REFERENCES Contas(id)
);

CREATE TABLE Vencimentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(255),
    data_vencimento DATE,
    valor DECIMAL(10, 2),
    pago BOOLEAN DEFAULT FALSE
);