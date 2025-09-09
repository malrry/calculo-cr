require 'tempfile'

RSpec.describe AlunoDisciplinas::CsvLoader, type: :services do
    # o teste n estava funcionando porque meu loader espera um path e eu estava enviando o conteudo de um csv direto,
    # ent pra resolver esse problema eu escolhi importar a biblioteca de arquivo temporario

    describe "#load" do
        context "when load is successful" do
            it "populates the database" do
                csv_content = "MATRICULA,COD_DISCIPLINA,COD_CURSO,NOTA,CARGA_HORARIA,ANO_SEMESTRE\n" \
                "100,SEN00209,4,82,60,20171\n" \
                "102,MPS00012,56,90,30,20181\n" \
                "105,SGE00014,4,8,30,20171\n"

                csv_file = Tempfile.new([ 'test_file', '.csv' ])
                csv_file.write(csv_content)
                csv_file.rewind

                service = described_class.new(csv_file.path).load
                expect(Aluno.count).to eq 3
                expect(Disciplina.count).to eq 3
                expect(AlunoDisciplina.count).to eq 3
            end
        end
    end
end
