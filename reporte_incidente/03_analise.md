# 03 - Análise de Causa Raiz

## Fatores Contribuintes

1. **Permissões Excessivas (Principal):** O usuário da recepção nunca deveria ter permissão de `DELETE` em ambiente de produção. Operações de exclusão devem ser tratadas via Stored Procedures ou restritas a perfis de nível superior.

2. **Falha Humana:**
   Execução de scripts de manipulação de dados (DML) diretamente em produção sem o uso de transações (`BEGIN TRAN`) e sem a devida atenção à cláusula de filtragem.

3. **Verificação de Dados em Risco:**
   * **Horário do Incidente:** 10:19 AM. 
   * **Status do Backup:** O último backup de log foi às 10:00 AM. 
   * **Diagnóstico:** Havia **19 minutos de dados** (transações) presentes apenas no Log de Transações Ativo (arquivo .LDF) que ainda não haviam sido persistidos em um arquivo de backup (.TRN).