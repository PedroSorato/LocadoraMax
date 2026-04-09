📂 Projeto: Estratégia de Backup e Disaster Recovery - LocadoraMax

Este repositório contém o desenvolvimento de um ambiente de banco de dados para uma locadora de veículos (LocadoraMax), focado na implementação de uma estratégia robusta de recuperação de dados e administração de objetos via SQL Server.

🎯 Objetivo do Projeto

Demonstrar habilidades técnicas em administração de banco de dados (DBA), incluindo:

Modelagem lógica com separação por Schemas.

Geração de massa de dados para testes de volume.

Simulação de falha humana e corrupção de dados.

Execução de Point-in-Time Recovery (Recuperação em um ponto específico no tempo).

🏗️ Estrutura do Banco de Dados

O banco foi organizado em dois schemas principais para garantir a governança e segurança dos dados:

Schema Frota: Tabelas de Veiculos e Categorias.

Schema Aluguel: Tabelas de Clientes, Locacoes e Pagamentos.

📈 Estratégia de Continuidade de Negócio (SLA)

Para este projeto, foram definidas métricas de recuperação baseadas em um cenário de operação padrão de locação:

RPO (Recovery Point Objective): 1 hora.

Justificativa: O banco de dados realiza backups do Log de Transações a cada 60 minutos. Em caso de desastre, a perda máxima de dados aceitável pela regra de negócio é de 1 hora de registros.

RTO (Recovery Time Objective): 30 minutos.

Justificativa: Tempo estimado para que o DBA identifique o incidente, localize os arquivos de backup (Full + Logs) e finalize o processo de restauração para colocar o sistema online novamente.

🛠️ Cenário de Desastre e Recuperação

O grande diferencial deste projeto é o script de Disaster Recovery.

O Problema:

Simulamos um erro crítico onde a tabela Aluguel.Pagamentos sofre um DELETE sem cláusula WHERE após o backup full diário. Como o erro ocorreu entre os intervalos de backup de log, foi necessário demonstrar precisão na recuperação.

A Solução:

Utilizando o Full Recovery Model, a recuperação foi realizada seguindo estes passos:

Realização do Tail-Log Backup para capturar as transações do log ativo.

Restore do último Backup Full com a opção NORECOVERY.

Restore dos Logs de Transações sequenciais.

Aplicação do parâmetro STOPAT para interromper a restauração exatamente um minuto antes do comando de deleção acidental.
