RSpec.describe DisciplinasController, type: :request do    
    describe "index" do
        context 'when there are classes' do 

            it 'returns classes' do
                curso = Curso.create
                disciplina1 = Disciplina.create(curso: curso)
                disciplina2 = Disciplina.create(curso: curso)
                get disciplinas_path # acessa o caminho do meu controlador
                expect(response.body).to include(disciplina1.id.to_s)
                expect(response.body).to include(disciplina2.id.to_s)
                expect(response.body).to include("Contagem total de disciplinas: 2")

            end
        end

        context 'when there are no classes' do 
            it 'does not have table rows' do
                get disciplinas_path
                expect(response.body).not_to include('td') 
                expect(response.body).to include("Contagem total de disciplinas: 0")
            end
        end
    end
end