require 'rmagick'
require 'csv'
require 'color'
include Magick

class ReadableImage
  attr_reader :image_name

  def initialize(image_name)
    @image_name = image_name
  end

  def image
    ImageList.new(image_name)
  end

  def color_map
    create_color_map
  end

  def create
    create_color_map
    get_pixels
    create_canvas
    create_readable_image
  end

  def test
    create_color_map
    puts 'CREATED COLOR MAP!'
    get_pixels
  end

  # creates hash with list of colors in image, truncates hex values of color
  def create_color_map
    colors = []
    color_map = {}
    image.colors.times { |i| colors.push(image.colormap(i).delete_suffix('FFFF')) }
    colors.length.times do |n|
      if colors[n][0] == "#"
        color_map[n] = colors[n].gsub(/#(.{2}).{2}(.{2}).{2}(.{2}).{2}/, '#\1\2\3')
      else
        color_map[n] = "#FFFFFF"
      end
    end
    color_map
  end

  # creates array of hex color value of each pixel in image
  def get_pixels
    @pixels = []
    image[0].each_pixel do |pixel|
      color = pixel.to_color(Magick::SVGCompliance, false, 8, true)
      @pixels.push(color_map.key(color))
    end
  end

  # creates multi-dimesional array from pixels based off rows and columns in image
  def create_canvas
    @canvas = []
    image.rows.times do
      @canvas.push(@pixels.slice!(0, image.columns))
    end
    puts "CANVAS CREATED!"
  end

  # writes mulit-dimesional to file to create a readable iamge file
  def create_readable_image
    CSV.open('public/canvas.csv', 'w', col_sep: " ") do |csv|
      @canvas.each { |ar| csv << ar }
      csv << ["eoc"]
      color_map.each { |key,color| csv << ["#{key}:#{color}"]}
    end
    puts "FILE CREATED!"
  end
end

# puts ReadableImage.new("public/winnie.gif").create
