class CreateAlunos < ActiveRecord::Migration[8.0]
  def change
    create_table :alunos do |t|
      t.string :matricula
      t.integer :cr

      t.timestamps
    end
  end
end
