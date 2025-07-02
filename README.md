# 🌐 Desafio_BANCO_DE_DADOS---INDICES-e-PROCEDURES
Repositório contendo scripts SQL para manipulação de dados, incluindo consultas (queries), criação de índices para otimização e procedures para automação de processos.

## 📈 Índices Criados e Justificativa
Os índices foram criados com o objetivo de acelerar as consultas que utilizam colunas de junção e filtros frequentes, tais como:

- `index_numero_departamento` na tabela `employee` sobre a coluna `Dno` — para acelerar buscas e agrupamentos por departamento.
- `index_Dnumber` na tabela `departament` sobre a coluna `Dnumber` — para facilitar a junção e pesquisa por número do departamento.

- > ➡️ **Importante:** Índices melhoram a velocidade das consultas, mas devem ser usados com critério para não prejudicar operações de inserção e atualização.


## ⚙️ Tecnologias Utilizadas
- MySQL / PostgreSQL (compatível com ambos)
- SQL puro (DDL e DML)
- Ferramentas recomendadas: MySQL Workbench


## 🚀 Como Executar
1. Execute os scripts de criação de índices para otimizar o banco.
2. Utilize as queries para obter informações importantes sobre departamentos e empregados.
3. Modifique e expanda conforme necessidade do seu projeto ou análise.


## Considerações finais
Lembre-se que a criação de índices deve ser feita com base na análise das consultas mais frequentes para garantir um desempenho equilibrado entre leitura e escrita no banco de dados.

