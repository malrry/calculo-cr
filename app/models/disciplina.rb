class Disciplina < ApplicationRecord
    belongs_to :curso # n pra 1
    has_many :aluno_disciplinas # indica que disciplina tem varios registros da relaçao "aluno_disciplinas"
    has_many :alunos, through: :aluno_disciplinas # alem disso, disciplina tem varios alunos, por meio da relacao "aluno_disciplinas"
end
