require "csv"


module AlunoDisciplinas
    class CsvLoader
        def initialize(path)
            @path = path
        end

        def load
            CSV.foreach(@path, headers: true, header_converters: :symbol) do |row|
                curso = Curso.find_or_create_by(codigo_curso: row[:cod_curso])
                aluno = Aluno.find_or_create_by(matricula: row[:matricula])
                disciplina = Disciplina.find_or_create_by(codigo_disciplina: row[:cod_disciplina], carga_horaria: row[:carga_horaria], curso_id: curso.id)
                AlunoDisciplina.find_or_create_by(aluno_id: aluno.id,  disciplina_id: disciplina.id, nota_aluno: row[:nota], ano_semestre: row[:ano_semestre])
            end
        end
    end
end
