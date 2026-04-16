# Agent Job: Backup Diferencial Diário

##  Agendamento
* **Frequência:** Diária (Segunda a Sábado)
* **Horário:** 01:00 AM

##  Por que Diário às 02:00?
1. **Redução do Tempo de Restore (RTO):** Se precisarmos restaurar o banco na quinta-feira, não precisamos aplicar todos os logs desde domingo. Aplicamos o Full (domingo) + o Diferencial mais recente (quinta 02:00) + apenas os logs das últimas horas.
2. **Otimização de Espaço:** O backup diferencial armazena apenas o que mudou desde o último Full. Ele é muito menor que um Full diário, economizando espaço em disco.
3. **Horário Estratégico:** Rodar às 02:00 garante que o backup Full (de domingo) já terminou e não conflita com processos de fechamento de caixa que ocorrem no final do dia.

##  Detalhes Técnicos
* **Tipo:** Differential
* **Objetivo:** Acelerar o processo de recuperação e economizar armazenamento.