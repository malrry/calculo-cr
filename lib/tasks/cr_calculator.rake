namespace :cr do
    task calculator: :environment do
      file_path = "data/notas.csv"
  
      AlunoDisciplinas::CsvLoader.new(file_path).load
  
      puts "------- O CR dos alunos é: --------"
      Aluno.find_each do |aluno|
        cr = Alunos::CrCalculator.new(aluno).calculate
        aluno.update(cr: cr)
        puts "#{aluno.matricula}  -  #{cr}"
      end
      puts "-----------------------------------"
  
      puts "----- Média de CR dos cursos ------"
      Curso.find_each do |curso|
        media_cr = Cursos::CrCalculator.new(curso).calculate
        curso.update(media_cr: media_cr)
        puts "#{curso.codigo_curso}  -  #{media_cr}"
      end
      puts "-----------------------------------"
    end
end
  