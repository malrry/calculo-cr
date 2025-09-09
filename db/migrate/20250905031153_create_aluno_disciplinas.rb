class CreateAlunoDisciplinas < ActiveRecord::Migration[8.0]
  def change
    create_table :aluno_disciplinas do |t|
      t.references :aluno, null: false, foreign_key: true
      t.references :disciplina, null: false, foreign_key: true

      t.integer :nota_aluno
      t.integer :ano_semestre

      t.timestamps
    end
  end
end
