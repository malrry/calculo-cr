# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_09_05_031153) do
  create_table "aluno_disciplinas", force: :cascade do |t|
    t.integer "aluno_id", null: false
    t.integer "disciplina_id", null: false
    t.integer "nota_aluno"
    t.integer "ano_semestre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aluno_id"], name: "index_aluno_disciplinas_on_aluno_id"
    t.index ["disciplina_id"], name: "index_aluno_disciplinas_on_disciplina_id"
  end

  create_table "alunos", force: :cascade do |t|
    t.string "matricula"
    t.integer "cr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cursos", force: :cascade do |t|
    t.string "codigo_curso"
    t.integer "media_cr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "disciplinas", force: :cascade do |t|
    t.string "codigo_disciplina"
    t.integer "carga_horaria"
    t.integer "curso_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["curso_id"], name: "index_disciplinas_on_curso_id"
  end

  add_foreign_key "aluno_disciplinas", "alunos"
  add_foreign_key "aluno_disciplinas", "disciplinas"
  add_foreign_key "disciplinas", "cursos"
end
