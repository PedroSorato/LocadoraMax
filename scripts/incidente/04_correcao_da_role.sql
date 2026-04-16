USE LocadoraMax;
GO

SELECT 
    dp.name AS [Principal_Name],
    dp.type_desc AS [Principal_Type],
    o.name AS [Object_Name],
    p.permission_name AS [Permission],
    p.state_desc AS [Permission_State],
    s.name AS [Schema_Name]
FROM sys.database_permissions AS p
JOIN sys.database_principals AS dp ON p.grantee_principal_id = dp.principal_id
LEFT JOIN sys.objects AS o ON p.major_id = o.object_id
LEFT JOIN sys.schemas AS s ON p.major_id = s.schema_id
WHERE dp.name IN ('usuario_recepcao', 'db_recepcao_role')
ORDER BY dp.name;

USE LocadoraMax
GO

-- Removendo a permissão da ROLE
REVOKE UPDATE, DELETE ON SCHEMA::Aluguel FROM db_recepcao_role;

