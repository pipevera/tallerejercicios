class Carta
  attr_accessor :name, :color
  def initialize(name, color)
    @name = name
    @color = color
  end
end

eleccion = gets.chomp

if eleccion == 'jugar'
  pinta = ['Diamante', 'corazon', 'Trebol', 'Picas']
  mano = []
  5.times do |x|
    mano << Carta.new(rand(1..13), pinta[rand(0..3)])
  end

  while eleccion != 'salir'

    puts 'guardar para almacenar las cartas en un archivo'
    puts 'mostrar para ver las cartas en pantalla'
    puts 'leer para leer las cartas desde un archivo'
    puts 'salir para cerrar el programa'

    eleccion = gets.chomp

    if eleccion == 'guardar'

      file = File.open('cartas.txt', 'w')
      mano.each do |x|
        file.puts "#{x.name} #{x.color}"
      end
      file.close

    elsif eleccion == 'mostrar'

      mano.each do |x|
        puts "#{x.name} de #{x.color}"
      end

    elsif eleccion == 'leer'

      file = File.open('cartas.txt', 'r')
      content = file.readlines
      file.close

      data = []
      content.each do |x|
        data << x.split(' ')
      end

      mano = []

      data.each do |x|
        mano << Carta.new(x[0], x[1])
      end

    end

  end
end