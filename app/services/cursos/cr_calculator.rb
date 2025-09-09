module Cursos
    class CrCalculator
        # media de cr de alunos que fizeram disciplinas do mesmo curso
        # media = sum cr de todos alunos que fizeram disciplinas daquele curso / quantidade de alunos
        def initialize(curso)
            @curso = curso
        end

        def calculate
            alunos = []

            @curso.disciplinas.each do |disciplina|
                disciplina.alunos.each do |aluno|
                    alunos << aluno
                end
            end
            alunos.uniq!

            soma_cr = alunos.sum(&:cr)
            qtd_alunos = alunos.count
            (soma_cr / qtd_alunos)
        end
    end
end
