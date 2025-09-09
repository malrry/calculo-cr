class AlunoDisciplina < ApplicationRecord
    belongs_to :aluno
    belongs_to :disciplina
  # so olhar os ids que tem na relaçao que ajuda a definir o que precisa ter aqui
end
