RSpec.describe Cursos::CrCalculator, type: :services do
    
    describe "#calculate" do
        context "when there are majors average scores to calculate" do
            it "calculates average cr" do
                curso = Curso.create
                disciplina = Disciplina.create(curso: curso)
                aluno1 = Aluno.create(cr: 88)
                aluno_disciplina1 = AlunoDisciplina.create(aluno: aluno1, disciplina: disciplina)
                aluno2 = Aluno.create(cr: 50)
                binding.pry
                aluno_disciplina2 = AlunoDisciplina.create(aluno: aluno2, disciplina: disciplina)
                aluno3 = Aluno.create(cr: 45)
                aluno_disciplina3 = AlunoDisciplina.create(aluno: aluno3, disciplina: disciplina)


                service = described_class.new(curso).calculate
                expect(service).to eq(61)      
            end
        end
    end
end