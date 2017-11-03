class Product
  attr_accessor :name, :azul, :rojo, :verde
  def initialize(name, azul = 0, rojo = 0, verde = 0)
    @name = name
    @azul = azul
    @rojo = rojo
    @verde = verde
  end
end

puts 'ingrese un nuevo producto'
nombre = gets.chomp
puts 'ingrese stock 1'
stock1 = gets.chomp
puts 'ingrese stock 2'
stock2 = gets.chomp
puts 'ingrese stock 3'
stock3 = gets.chomp

File.open('products.txt', 'a'){ |x|
  x.puts "#{nombre} #{stock1} #{stock2} #{stock3}"
}

file = File.open('products.txt','r')
lines = file.readlines
file.close

products = []
lines.each do |line|
  data = line.split(" ")
  products << Product.new(data[0], data[1].to_i, data[2].to_i, data[3].to_i)
end

puts
print products