
[1mFrom:[0m /home/julia/workspace/desafio-sti/calculo-cr/app/services/cursos/cr_calculator.rb:30 Cursos::CrCalculator#calculate:

     [1;34m9[0m:         [32mdef[0m [1;34mcalculate[0m
    [1;34m10[0m:             [1;34m#  "SELECT DISTINCT \"alunos\".* FROM \"alunos\" [0m
    [1;34m11[0m:             [1;34m# INNER JOIN \"aluno_disciplinas\" ON \"aluno_disciplinas\".\"aluno_id\" = \"alunos\".\"id\" [0m
    [1;34m12[0m:             [1;34m# INNER JOIN \"disciplinas\" ON \"disciplinas\".\"id\" = \"aluno_disciplinas\".\"disciplina_id\" [0m
    [1;34m13[0m:             [1;34m# WHERE \"disciplinas\".\"curso_id\" = 1"[0m
    [1;34m14[0m:             [1;34m#alunos = Aluno.joins(:disciplinas).where(disciplinas: { curso_id: @curso.id }).distinct[0m
    [1;34m15[0m: 
    [1;34m16[0m:             crs = []
    [1;34m17[0m: 
    [1;34m18[0m:             @curso.disciplinas.each [32mdo[0m |disciplina|
    [1;34m19[0m:                 disciplina.alunos.each [32mdo[0m |aluno|
    [1;34m20[0m:                 crs << aluno.cr
    [1;34m21[0m:                 [32mend[0m
    [1;34m22[0m:             [32mend[0m
    [1;34m23[0m: 
    [1;34m24[0m:             [1;34m#ou:[0m
    [1;34m25[0m:             crs = @curso.disciplinas.map { |disciplina| disciplina.alunos.map(&[33m:cr[0m) }.flatten
    [1;34m26[0m: 
    [1;34m27[0m: 
    [1;34m28[0m:             [1;34m#soma_cr = alunos.sum(:cr)            [0m
    [1;34m29[0m:             [1;34m#qtd_alunos = alunos.count[0m
 => [1;34m30[0m: binding.pry
    [1;34m31[0m:             soma_cr = crs.sum
    [1;34m32[0m:             qtd_alunos = qtd.count
    [1;34m33[0m: 
    [1;34m34[0m: 
    [1;34m35[0m:             (soma_cr / qtd_alunos)
    [1;34m36[0m:         [32mend[0m

