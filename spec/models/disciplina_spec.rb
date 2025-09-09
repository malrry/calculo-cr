RSpec.describe Disciplina, type: :model do
  describe "associations" do
      it { is_expected.to belong_to :curso }
      it { is_expected.to have_many :aluno_disciplinas }
      it { is_expected.to have_many :alunos }
  end
end
