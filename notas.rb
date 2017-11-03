file = File.open('notas.txt', 'r')
content = file.readlines
file.close

class Student
  attr_accessor :nombre, :nota1, :nota2, :nota3
  def initialize(nombre, nota1 = 0, nota2 = 0, nota3 = 0)
    @nombre = nombre
    @nota1 = nota1
    @nota2 = nota2
    @nota3 = nota3
  end

end

def promedio_alumno(registros)
  registros.each do |x|
    promedio = (x.nota1 + x.nota2 + x.nota3) / 3
    puts "el promedio de #{x.nombre} es #{promedio}"
  end
end
alumnos = []

content.each do |x|
  data = x.split(', ')
  alumnos << Student.new(data[0], data[1].to_i, data[2].to_i, data[3].to_i)
end

promedio_alumno(alumnos)