class ImageHandler
  attr_reader :original_file_name, :processed_file_name

  def initialize(original_file_name, processed_file_name)
    @original_file_name = original_file_name
    @processed_file_name = processed_file_name
  end

  def process
    set_size
    reduce_colors
  end

  private
  def set_size
    cmd = "convert public/#{original_file_name} -resize 50x50 public/#{processed_file_name}"
    system(cmd)
  end

  def reduce_colors
    cmd = "convert public/#{processed_file_name} +dither -colors 15 public/#{processed_file_name}"
    system(cmd)
  end
end
