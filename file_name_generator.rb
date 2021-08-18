class FileNameGenerator
  attr_reader :file_name

  def initialize(file_name)
    @file_name = file_name
  end

  def processed_file_name
    # removes file extension
    no_ext = File.basename(file_name, File.extname(file_name))
    file_name = no_ext.concat('.gif')
  end
end
