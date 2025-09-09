class CreateCursos < ActiveRecord::Migration[8.0]
  def change
    create_table :cursos do |t|
      t.string :codigo_curso
      t.integer :media_cr

      t.timestamps
    end
  end
end
