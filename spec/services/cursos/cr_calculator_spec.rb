RSpec.describe Cursos::CrCalculator, type: :services do
    describe "#calculate" do
        context "when there are majors average scores to calculate" do
            it "calculates average cr" do
                curso = Curso.create
                disciplina = Disciplina.create(curso: curso)
                disciplina2 = Disciplina.create(curso: curso)
                aluno1 = Aluno.create(cr: 90)
                aluno_disciplina1 = AlunoDisciplina.create(aluno: aluno1, disciplina: disciplina)
                aluno2 = Aluno.create(cr: 10)
                aluno_disciplina3 = AlunoDisciplina.create(aluno: aluno2, disciplina: disciplina)
                aluno_disciplina4 = AlunoDisciplina.create(aluno: aluno2, disciplina: disciplina2)


                service = described_class.new(curso).calculate
                expect(service).to eq(50)
            end
        end
    end
end
