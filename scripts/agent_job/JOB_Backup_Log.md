# Agent Job: Backup de Log de Transações

##  Agendamento
* **Frequência:** A cada 1 hora
* **Horário:** Todos os dias, recorrente

##  Por que a cada 1 hora?
1. **Conformidade com o RPO:** Este job é o responsável direto por garantir o nosso **RPO de 1 hora**. Em caso de falha crítica de hardware, a empresa perde no máximo os últimos 60 minutos de dados.
2. **Truncamento de Log:** O Log de Transações do SQL Server cresce indefinidamente até que um backup seja feito. Rodar a cada 1 hora garante que o arquivo `.ldf` não ocupe todo o espaço do disco do servidor.
3. **Point-in-Time Recovery:** É este backup que permite que o DBA recupere o banco em um horário específico (ex: 14:32), evitando que um erro cometido à tarde exija a perda de todo o trabalho do dia.

##  Detalhes Técnicos
* **Tipo:** Transaction Log
* **Objetivo:** Proteção contra perda de dados e manutenção do tamanho dos arquivos de log.