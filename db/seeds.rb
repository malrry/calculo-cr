# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

FILE_PATH = "data/notas.csv"
data = AlunoDisciplinas::CsvLoader.new(FILE_PATH).load

# aluno_disciplinas/csv_loader.rb

Aluno.all.each do |aluno|
    cr = Alunos::CrCalculator.new(aluno).calculate
    aluno.update(cr: cr)
end

Curso.all.each do |curso|
    media_cr = Cursos::CrCalculator.new(curso).calculate
    curso.update(media_cr: media_cr)
end
