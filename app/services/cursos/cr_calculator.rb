module Cursos
    class CrCalculator
        # media de cr de alunos que fizeram disciplinas do mesmo curso
        # media = sum cr de todos alunos que fizeram disciplinas daquele curso / quantidade de alunos
        def initialize(curso)
            @curso = curso
        end

        def calculate
            crs = []

            @curso.disciplinas.each do |disciplina|
                disciplina.alunos.each do |aluno|
                    crs << aluno.cr
                end
            end

            soma_cr = crs.sum
            qtd_alunos = crs.count
            (soma_cr / qtd_alunos)
        end
    end
end
