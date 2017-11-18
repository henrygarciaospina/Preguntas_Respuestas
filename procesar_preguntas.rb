require 'csv'
require_relative 'pregunta'

class ProcesarPreguntas
  attr_reader :preguntas

  def initialize
    @preguntas = []

    construir_preguntas
  end

  def take!
    @preguntas.shift
  end

  def length
    @preguntas.length
  end

  private
    def construir_preguntas
      cargar_preguntas = CSV.read('preguntas_respuestas.txt').shuffle
      
      cargar_preguntas.each do |pregunta|
        @preguntas << Pregunta.new(pregunta[0],pregunta[1])
      end
    end
end