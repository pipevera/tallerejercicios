file = File.open('movies.txt', 'r')
content = file.readlines
file.close

a = []
content.each do |x|
  a << x.split(/\W+/)
end

a.delete_at(0)
a.delete([])

movies = []
a.each_slice(5) do |arr|
  movies << arr
end

movies.each do |x|
  puts "#{x[0][1]} #{x[0][2]}"
end