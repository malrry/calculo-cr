RSpec.describe Aluno, type: :model do
    describe "associations" do
        it { is_expected.to have_many :aluno_disciplinas }
        it { is_expected.to have_many :disciplinas }
    end
end
