# Agent Job: Backup Full Semanal

##  Agendamento
* **Frequência:** Todo Domingo
* **Horário:** 02:00 AM

##  Por que Domingo às 00:00?
1. **Baixo Tráfego:** Domingo é o dia com menor volume de locações e transações financeiras na "LocadoraMax". Escolher este horário minimiza o impacto de I/O (entrada e saída de dados) no disco durante a leitura de todo o banco.
2. **Base da Corrente de Backup:** O backup Full limpa a base para os backups diferenciais da semana seguinte. Iniciá-lo no primeiro minuto da semana garante uma estrutura limpa e organizada.
3. **Janela de Manutenção:** Caso o banco cresça muito no futuro, a madrugada de domingo oferece a maior janela de tempo sem interromper usuários.

##  Detalhes Técnicos
* **Tipo:** Full
* **Objetivo:** Garantir a integridade total dos dados e permitir a reconstrução completa do banco do zero.