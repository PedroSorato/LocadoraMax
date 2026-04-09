-- 1. Criação do Banco de Dados
CREATE DATABASE LocadoraMax;
GO

-- Garante que o banco use o modo de recuperação FULL para permitir Restore Point-in-Time
ALTER DATABASE LocadoraMax SET RECOVERY FULL;
GO

USE LocadoraMax;
GO

-- 2. Criação dos Schemas
CREATE SCHEMA Frota;
GO

CREATE SCHEMA Aluguel;
GO

-- 3. Estrutura das Tabelas
USE LocadoraMax;
GO

-- Tabelas do Schema Frota
CREATE TABLE Frota.Categorias (
    ID_Categoria INT PRIMARY KEY IDENTITY(1,1),
    Descricao VARCHAR(50) NOT NULL,
    Valor_Diaria DECIMAL(10,2) NOT NULL
);

CREATE TABLE Frota.Veiculos (
    ID_Veiculo INT PRIMARY KEY IDENTITY(1,1),
    ID_Categoria INT CONSTRAINT FK_Veiculos_Categorias FOREIGN KEY REFERENCES Frota.Categorias(ID_Categoria),
    Modelo VARCHAR(50) NOT NULL,
    Placa CHAR(7) UNIQUE NOT NULL,
    Status VARCHAR(20) DEFAULT 'Disponível'
);

-- Tabelas do Schema Aluguel
CREATE TABLE Aluguel.Clientes (
    ID_Cliente INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(100) NOT NULL,
    CPF CHAR(11) UNIQUE NOT NULL,
    Email VARCHAR(100)
);

CREATE TABLE Aluguel.Locacoes (
    ID_Locacao INT PRIMARY KEY IDENTITY(1,1),
    ID_Cliente INT CONSTRAINT FK_Locacoes_Clientes FOREIGN KEY REFERENCES Aluguel.Clientes(ID_Cliente),
    ID_Veiculo INT CONSTRAINT FK_Locacoes_Veiculos FOREIGN KEY REFERENCES Frota.Veiculos(ID_Veiculo),
    Data_Inicio DATETIME DEFAULT GETDATE(),
    Data_Fim_Prevista DATETIME NOT NULL
);

CREATE TABLE Aluguel.Pagamentos (
    ID_Pagamento INT PRIMARY KEY IDENTITY(1,1),
    ID_Locacao INT CONSTRAINT FK_Pagamentos_Locacoes FOREIGN KEY REFERENCES Aluguel.Locacoes(ID_Locacao),
    Valor_Total DECIMAL(10,2) NOT NULL,
    Data_Pagamento DATETIME DEFAULT GETDATE()
);
GO