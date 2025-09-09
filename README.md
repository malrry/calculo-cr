# README

# Sistema de Gestão Acadêmica

Este é um projeto em Ruby on Rails projetado para gerenciar dados acadêmicos. A aplicação importa informações de alunos, disciplinas e cursos a partir de um arquivo CSV, calcula o Coeficiente de Rendimento (CR) para cada aluno e a média de CR para cada curso, e exibe essas informações através de uma interface web simples.

## Modelagem de Dados

A arquitetura do banco de dados é organizada em torno de quatro modelos principais que se relacionam para representar a estrutura acadêmica.

```
+-----------+      +---------------------+      +-------------------+      +---------+
|   Curso   |----<|     Disciplina       |----<|   AlunoDisciplina  |>----|   Aluno  |
+-----------+      +---------------------+      +-------------------+      +---------+
| id        |      | id                  |      | id                |      | id      |
| codigo_curso|    | codigo_disciplina   |      | aluno_id          |      | matricula |
| media_cr  |      | carga_horaria       |      | disciplina_id     |      | cr      |
+-----------+      | curso_id (FK)       |      | nota_aluno        |      +---------+
                   +---------------------+      | ano_semestre      |
                                                +-------------------+
```

  * **Curso**: Representa um curso acadêmico.
      * `has_many :disciplinas`
  * **Disciplina**: Representa uma disciplina, que pertence a um curso.
      * `belongs_to :curso`
      * `has_many :alunos, through: :aluno_disciplinas`
  * **Aluno**: Representa um estudante.
      * `has_many :disciplinas, through: :aluno_disciplinas`
  * **AlunoDisciplina**: Tabela de junção que conecta alunos a disciplinas, registrando a nota e o período cursado.
      * `belongs_to :aluno`
      * `belongs_to :disciplina`

## Funcionalidades Principais

  * **Importação de Dados via CSV**: Utiliza um serviço (`AlunoDisciplinas::CsvLoader`) para popular o banco de dados a partir de um arquivo `notas.csv`.
  * **Cálculo de CR do Aluno**: Um serviço (`Alunos::CrCalculator`) calcula o Coeficiente de Rendimento de cada aluno com base na fórmula: `CR = Σ(nota * carga_horaria) / Σ(carga_horaria)`.
  * **Cálculo de CR Médio do Curso**: Um serviço (`Cursos::CrCalculator`) calcula a média dos CRs de todos os alunos associados a um determinado curso.
  * **Navegação Web**: Interface para listar e visualizar detalhes de Alunos, Cursos e Disciplinas.

## Como Executar o Projeto

Siga os passos abaixo para instalar e rodar a aplicação em seu ambiente de desenvolvimento.

### Pré-requisitos

  * Ruby / Rails
  * Bundler
  * SQLite3

### Instalação

1.  Clone o repositório para sua máquina local.
2.  Instale as dependências do projeto:
    ```sh
    bundle install
    ```
3.  Crie e prepare o banco de dados:
    ```sh
    rails db:create
    rails db:migrate
    ```

### Populando o Banco de Dados

Existem duas maneiras de popular o banco de dados com as informações do arquivo `data/notas.csv`.

#### Opção 1: Usando a Rake Task

Esta é a opção recomendada, pois ela carrega os dados e exibe os resultados dos cálculos de CR diretamente no terminal.

1.  Execute a seguinte tarefa Rake:
    ```sh
    rails cr:calculator
    ```
2.  A tarefa irá:
      * Carregar os dados do arquivo `data/notas.csv` para o banco.
      * Calcular o CR de cada aluno e exibir os resultados.
      * Calcular a média de CR de cada curso e exibir os resultados.

#### Opção 2: Usando o Seed

Este método também popula o banco de dados e calcula os CRs, mas não exibe os resultados no console.

1.  Execute o comando de seed do Rails:
    ```sh
    rails db:seed
    ```

### Executando os Testes

O projeto possui uma suíte de testes robusta utilizando RSpec para garantir a qualidade e o comportamento esperado das funcionalidades. Para rodar todos os testes, execute:

```sh
rspec
```

### Qualidade e Estilo de Código com RuboCop

Para garantir a consistência e a qualidade do código, este projeto utiliza a gem `rubocop`, um analisador de código estático (linter) e formatador para Ruby. Ele ajuda a seguir as boas práticas e o guia de estilo da comunidade.

1.  Para corrigir automaticamente a maioria das ofensas de layout e estilo encontradas, utilize o comando:

    ```sh
    rubocop -a
    ```

### Iniciando o Servidor

Após popular o banco de dados com uma das opções acima, inicie o servidor Rails:

```sh
rails s
```

Agora você pode acessar a aplicação em seu navegador no endereço [http://localhost:3000](https://www.google.com/search?q=http://localhost:3000).
