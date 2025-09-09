class CreateDisciplinas < ActiveRecord::Migration[8.0]
  def change
    create_table :disciplinas do |t|
      t.string :codigo_disciplina
      t.integer :carga_horaria
      t.references :curso, null: false, foreign_key: true

      t.timestamps
    end
  end
end
