-- 4. Carga de Dados Inicial
USE LocadoraMax;
GO

-- Inserindo Categorias Fixas
INSERT INTO Frota.Categorias (Descricao, Valor_Diaria) 
VALUES 
('Econômico', 80.00), 
('Sedan', 120.00), 
('SUV', 250.00), 
('Premium', 500.00);
GO

-- =========================
-- CLIENTES (1000)
-- =========================
WITH Numeros AS (
    SELECT TOP 1000 
        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
    FROM sys.objects a
)
INSERT INTO Aluguel.Clientes (Nome, CPF, Email)
SELECT
    'Usuario ' + CAST(n AS VARCHAR),
    RIGHT('00000000000' + CAST(n AS VARCHAR), 11),
    'contato' + CAST(n AS VARCHAR) + '@provedor.com'
FROM Numeros;
GO

-- =========================
-- VEICULOS (500)
-- =========================
WITH Numeros AS (
    SELECT TOP 500 
        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
    FROM sys.objects
)
INSERT INTO Frota.Veiculos (ID_Categoria, Modelo, Placa, Status)
SELECT
    ((n - 1) % 4) + 1, -- distribui entre 4 categorias
    'Modelo-' + CAST(n AS VARCHAR),
    RIGHT('AAA0000' + CAST(n AS VARCHAR), 7), -- garante UNIQUE
    'Disponível'
FROM Numeros;
GO

-- =========================
-- LOCACOES (1000)
-- =========================
WITH Numeros AS (
    SELECT TOP 1000 
        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
    FROM sys.objects a
)
INSERT INTO Aluguel.Locacoes (ID_Cliente, ID_Veiculo, Data_Fim_Prevista)
SELECT
    ((n - 1) % 1000) + 1, -- clientes válidos
    ((n - 1) % 500) + 1,  -- veículos válidos
    DATEADD(DAY, (n % 10) + 1, GETDATE())
FROM Numeros;
GO

-- =========================
-- PAGAMENTOS
-- =========================
INSERT INTO Aluguel.Pagamentos (ID_Locacao, Valor_Total)
SELECT 
    ID_Locacao,
    100 + (ID_Locacao % 1000)
FROM Aluguel.Locacoes;
GO