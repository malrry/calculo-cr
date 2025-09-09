class CursosController < ApplicationController
    def index
        @cursos = Curso.all
    end

    def show # pra ver todos os alunos desse curso
        @curso = Curso.find(params[:id])
    end
end
