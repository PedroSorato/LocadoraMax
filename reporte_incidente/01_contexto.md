# 01 - Contexto Operacional

**Data do Cenário:** 14/04/2026  
**Ambiente:** Produção (Instância SQL Server)  
**Banco de Dados:** `LocadoraMax`

## Cenário
O banco de dados `LocadoraMax` opera sob o **Full Recovery Model**. A base contém dados críticos de locação de veículos e transações financeiras. 

### Configurações de Segurança:
* **dba_admin:** Acesso total (db_owner).
* **usuario_recepcao:** Usuário operacional que, devido a uma falha na revisão de privilégios, recebeu a role `db_recepcao_role` com permissão explícita de `DELETE` no schema `Aluguel`.
