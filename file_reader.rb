class FileReader
  END_OF_CANVAS = "eoc"

  attr_reader :file_name

  def initialize(file_name)
    @file_name = file_name
  end

  def source_file
    File.readlines(file_name, chomp: true)
  end

  def eoc
    source_file.index(END_OF_CANVAS)
  end

  def canvas
    canvas = source_file.slice(0, eoc)
    canvas.map &:split
  end

  def yarns
    color_map = source_file.slice((eoc + 1)...)
    color_map.map { |value| value.split(":") }.to_h
  end

  def yarn_color(value)
    yarns[value.to_s]
  end
end
