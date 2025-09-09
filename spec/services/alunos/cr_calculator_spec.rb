RSpec.describe Alunos::CrCalculator, type: :services do
    describe "#calculate" do
        context "when there are students scores to calculate" do
            it "calculates cr" do
                curso = Curso.create
                aluno = Aluno.create
                disciplina = Disciplina.create(carga_horaria: 40, curso: curso)
                aluno_disciplina1 = AlunoDisciplina.create(aluno: aluno, disciplina: disciplina, nota_aluno: 95)
                aluno_disciplina2 = AlunoDisciplina.create(aluno: aluno, disciplina: disciplina, nota_aluno: 100)
                aluno_disciplina3 = AlunoDisciplina.create(aluno: aluno, disciplina: disciplina, nota_aluno: 70)
                service = described_class.new(aluno).calculate # chamando o metodo pra testar
                expect(service).to eq(88) # espero que o meu serviço retorne o resultado da conta (88)
            end
        end
    end
end
