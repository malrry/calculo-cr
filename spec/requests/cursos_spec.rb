RSpec.describe CursosController, type: :request do    
    describe "index" do
        context 'when there are majors' do 

            it 'returns majors' do
                curso1 = Curso.create
                curso2 = Curso.create                
                get cursos_path # acessa o caminho do meu controlador

                expect(response.body).to include(curso1.id.to_s)
                expect(response.body).to include(curso2.id.to_s)
                expect(response.body).to include("Contagem total de cursos: 2")

            end

        end

        context 'when there are no majors' do 
            it 'does not have table rows' do
                get cursos_path
                expect(response.body).not_to include('td') 
                expect(response.body).to include("Contagem total de cursos: 0")
            end
        end
    end
    describe "show" do 
        context "when show major" do
            it "contains students" do
                curso = Curso.create
                get curso_path(curso)
                expect(response.body).to include("Disciplinas desse curso: ")
            end
        end
    end  
end