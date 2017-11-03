require 'date'

class Empresa
  attr_accessor :name, :pagos
  def initialize(name, pagos = [])
    @name = name
    @pagos = pagos
  end

  def fechas_pagos_ant(fecha)
    @pagos.select { |x| x < fecha }
  end

  def fechas_pagos_pos(fecha = Date.today)
    @pagos.select { |x| x > fecha }
  end
end

file = File.open('fechas.txt', 'r')
content = file.readlines
file.close

pago_empresas = []
content.each do |lines|
  data = lines.chomp.split(' ')
  fecha = data.unshift
  name = data.shift
  dates = fecha.map { |f| Date.parse(f) }

  pago_empresas << Empresa.new(name, dates)
end

print pago_empresas[0].fechas_pagos_ant(Date.parse("2017-07-05"))
puts ''
print pago_empresas[2].fechas_pagos_pos