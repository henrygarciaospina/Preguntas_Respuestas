require_relative 'procesar_preguntas'
require 'colorize'

class Correr_Juego
  attr_reader :cargar_pregunta

  def initialize(cargar_pregunta)
    @cargar_pregunta = cargar_pregunta
  end

  def inicio
    puts "\t!Buena suerte! y a ganar..."
         "\tPara iniciar, digite la respuesta que cree que corresponde  a la pregunta..."

    aciertos = 0
    desaciertos = 0

     numero_de_preguntas = @cargar_pregunta.length
     pregunta = @cargar_pregunta.take!
    while pregunta != nil  && desaciertos < numero_de_preguntas*0.5
      print "\n\tPregunta: #{pregunta}? ".yellow  
      respuesta = gets.chomp

      if pregunta.is_valid?(respuesta)
        aciertos += 1
        puts "\tRespuesta correcta!".green
        pregunta = @cargar_pregunta.take!
      else
        desaciertos += 1
        puts "\tRespuesta incorrecta!, intentalo de nuevo".red
      end
    end
    
    puts aciertos == numero_de_preguntas ? "\n\t!Felicitaciones #{aciertos}/#{numero_de_preguntas} !!" : "\n\tVuelvelo a intentar #{aciertos}/#{numero_de_preguntas}, triunfaras :)"
  end
end

correr_juego = Correr_Juego.new(ProcesarPreguntas.new)
correr_juego.inicio