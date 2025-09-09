# CR = Nota(i)*CargaHoraria(i)/TotalCargaHoraria

module Alunos
    class CrCalculator
        def initialize(aluno)
            @aluno = aluno
        end

        def calculate
            # nota do aluno especifico
            # em qual materia ele tirou aquela nota
            # qual a carga horaria daquela materia
            # somar a carga horaria de todas as materias que ele fez

            # atualizar o campo cr em Alunos
            carga_horaria_total = @aluno.disciplinas.sum(:carga_horaria)

            multiplicacao = @aluno.aluno_disciplinas.map do |aluno_disciplina|
                nota = aluno_disciplina.nota_aluno
                ch = aluno_disciplina.disciplina.carga_horaria
                multiplicacao = nota * ch # o map pega a ultima linha do bloco e devolve em um array
            end
            cr = multiplicacao.sum / carga_horaria_total
        end
    end
end
# Alunos::CrCalculator.new(Aluno.first).calculate
