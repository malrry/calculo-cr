RSpec.describe AlunoDisciplina, type: :model do
    
  describe "associations" do 
      it { is_expected.to belong_to :aluno}
      it { is_expected.to belong_to :disciplina}
  end

end