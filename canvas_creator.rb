require 'rmagick'
require 'csv'
include Magick

winnie = ImageList.new('public/winnie-small.gif')

colors = []
color_map = {}
winnie.colors.times { |i| colors.push(winnie.colormap(i).delete_suffix('FFFF'))}
colors.length.times do |i|
  colors[i].slice!(4)
  colors[i].slice!(7)
  colors[i].slice!(10)
  color_map[i] = colors[i]
end
# puts color_map

pixels = []
winnie.each_pixel do |pixel|
  color = winnie.to_color(pixel)
  color.slice!(4)
  color.slice!(7)
  color.slice!(10)
  puts color
  pixels.push(color_map.key(color))
end
# puts pixels.inspect

canvas = []
winnie.rows.times do
  canvas.push(pixels.slice!(0, winnie.columns))
end
# puts canvas.inspect

CSV.open('img-canvas.txt', 'w', col_sep: " ") do |csv|
  canvas.each { |ar| csv << ar }
  csv << ["eoc"]
  color_map.each { |key,color| csv << ["#{key}:#{color}"]}
end
#
# def truncate
#   # code
# end
