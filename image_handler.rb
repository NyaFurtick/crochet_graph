class ImageHandler
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def crop
    cmd = "convert #{path} -resize 900x900 #{path}"
    system(cmd)
  end

  def reduce_colors
    cmd = "convert #{path} +dither -colors 15 #{path}"
    system(cmd)
  end
end
