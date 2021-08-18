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
    cmd = "convert #{path} +dither -colors 15 #{convert}"
    system(cmd)
  end

  private
  # converts image from whatever to gif
  def convert
    # removes file extension
    no_ext = File.basename(path, File.extname(path))
    path = no_ext.concat('.gif')
  end
end
