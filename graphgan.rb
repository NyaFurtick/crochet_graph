class Graphgan
  attr_reader :canvas, :yarns

  def initialize(canvas, yarns)
    @canvas = canvas
    @yarns = yarns
  end

  def yarn_color(value)
    yarns[value.to_s]
  end

  # returns readable hash with percentage values and color keys
  def display_frequency_table
    color_table = to_percent(frequency_table)
    color_table.transform_keys! {|k| yarns[k]}
  end

  # puts values on canvas in hash with value of num occurences
  def frequency_table
    freq_hash = Hash.new(0)
    canvas.each do |row|
      row.inject(freq_hash) { |hash, val| hash[val] += 1; hash}
    end
    freq_hash.sort_by {|k,v| -v}.to_h
  end

  # transforms values in hash to percent
  def to_percent(hash)
    num_pixels = canvas.length * canvas[0].length
    hash.each do |key, value|
      hash[key] = ((value / num_pixels.to_f) * 100).round(2)
    end
  end
end
