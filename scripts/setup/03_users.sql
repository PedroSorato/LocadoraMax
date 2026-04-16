USE LocadoraMax;
GO

-- 1. Criar os Logins (Instância) e Usuários (Banco)
CREATE LOGIN dba_admin WITH PASSWORD = 'SenhaForte@123';
CREATE USER dba_admin FOR LOGIN dba_admin;

CREATE LOGIN usuario_recepcao WITH PASSWORD = 'SenhaFraca!123';
CREATE USER usuario_recepcao FOR LOGIN usuario_recepcao;
GO

-- 2. Criar a Role de Admin e dar permissões totais
CREATE ROLE db_executor_admin;
ALTER ROLE db_owner ADD MEMBER dba_admin; -- Admin tem controle total

-- 3. Criar a Role da Recepção (O ERRO ESTÁ AQUI)
CREATE ROLE db_recepcao_role;
GRANT SELECT, INSERT, UPDATE ON SCHEMA::Aluguel TO db_recepcao_role;
GRANT DELETE ON SCHEMA::Aluguel TO db_recepcao_role; -- Jamais deveria ter DELETE em Produção!

ALTER ROLE db_recepcao_role ADD MEMBER usuario_recepcao;
GO