# 02 - O Incidente

**Horário do Evento:** 10:19 AM  
**Responsável:** `usuario_recepcao`

## Descrição do Erro
O usuário operacional tentou realizar a exclusão de um registro de teste que foi inserido erroneamente. Ao executar o script manualmente no Management Studio (SSMS), o usuário esqueceu de selecionar a cláusula `WHERE`.

### Comando Executado:
```sql
-- O usuário pretendia deletar apenas o ID 500
DELETE FROM Aluguel.Pagamentos; 
-- O comando acima foi rodado sem o WHERE ID_Pagamento = 500;