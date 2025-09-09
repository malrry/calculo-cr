RSpec.describe AlunosController, type: :request do    
    describe "index" do # bloco de teste do index
        context 'when there are students' do # bloco de contexto, voce usa pra separar cenarios
            it 'returns students' do
                aluno1 = Aluno.create
                aluno2 = Aluno.create                
                get alunos_path # acessa o caminho do meu controlador

                expect(response.body).to include(aluno1.id.to_s) # espera que a resposta do meu controlador esteja incluindo os ids dos alunos que eu criei
                expect(response.body).to include(aluno2.id.to_s) # to_s transforma em string, porque quando aparece no html está como string e para comparar, precisa ser do mesmo tipo, senao n vai funcionar
                expect(response.body).to include("Contagem total de alunos: 2")

            end

        end

        context 'when there are no students' do # faço esse contexto pra testar sem criar alunos justamente pra ver como se comporta quando meu ambiente simulado está vazio
            it 'does not have table rows' do # sempre que entra no it ele zera o banco de dados simulado
                get alunos_path
                expect(response.body).not_to include('td') # ele ta verificando se a resposta do meu html n contém a lista de alunos, que fica dentro do bloco 'td' no meu .html           end
                expect(response.body).to include("Contagem total de alunos: 0")
            end
        end
    end
    describe "show" do 
        context "when show student" do
            it "contains student informations" do
                aluno = Aluno.create
                get aluno_path(aluno)
                expect(response.body).to include("Disciplinas cursadas: ")
            end
        end
    end  
end