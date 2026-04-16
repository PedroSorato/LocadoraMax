# 04 - Plano de Recuperação (Restore)

**Objetivo:** Restaurar o banco para o estado das 10h16 (3 minutos antes do incidente).

## Procedimento Executado pelo DBA

1. **Tail-Log Backup:** Realizado o backup da "cauda do log" para capturar as transações entre 10h e 10h16, garantindo perda zero de dados.
   
2. **Restore Full (NORECOVERY):**
   Restauração do último backup Full de domingo. O banco permaneceu em estado *Restoring*.

3. **Restore Diferencial (NORECOVERY):**
   Restauração do último diferencial disponível (madrugada do dia 14/04).

4. **Restore de Log (Point-in-Time):**
   Aplicação dos logs sequenciais, finalizando com o comando:
   ```sql
   RESTORE LOG DriveDB FROM DISK = '...' 
   WITH STOPAT = '2026-04-14 10:15:44', RECOVERY;

## Acontecidos

1. Durante o incidente, foi necessário aplicar o comando SET SINGLE_USER WITH ROLLBACK IMMEDIATE para garantir acesso exclusivo ao banco, uma vez que sessões fantasmas impediam o backup da cauda do log.