class Aluno < ApplicationRecord
    has_many :aluno_disciplinas # 1 pra n, cada aluno tem varias ocorrencias de "aluno_disciplinas"
    has_many :disciplinas, through: :aluno_disciplinas # n pra n, cada disciplina tem varias ocorrencias de "aluno_disciplinas" por meio da tabela "aluno_disciplinas"
end
