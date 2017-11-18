class Pregunta
  attr_reader :pregunta, :respuesta

  def initialize(pregunta, respuesta)
    @pregunta = pregunta
    @respuesta = respuesta
  end

  def is_valid?(respuesta)
    self.respuesta == respuesta.downcase.strip
  end

  def to_s
    self.pregunta
  end
end