RSpec.describe Curso, type: :model do
    
  describe "associations" do 
      it { is_expected.to have_many :disciplinas}
  end

end