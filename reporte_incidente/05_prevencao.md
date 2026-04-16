# 05 - Plano de Prevenção

Para evitar a recorrência deste incidente e fortalecer a resiliência do ambiente, as seguintes medidas foram adotadas:

## 1. Ajuste de Permissões (Princípio do Menor Privilégio)
A role `db_recepcao_role` foi reestruturada. A permissão de `UPDATE` e `DELETE` foram revogadas permanentemente para este perfil. 

```sql
-- Script de Correção
REVOKE UPDATE, DELETE ON SCHEMA::Aluguel FROM db_recepcao_role;;