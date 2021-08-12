require "minitest/autorun"
require "./graphgan"
require "./file_reader"

class GraphganTest < Minitest::Test
  describe "initialization" do
    file = FileReader.new("canvas_test.txt")
    canvas = file.create_canvas
    yarns = file.list_yarns
    graph = Graphgan.new(canvas, yarns)

    it "creates an instance of Graphgan" do
      assert graph.is_a? Graphgan
    end

    it "initializes Graphgan with a canvas" do
      assert graph.canvas
    end

    it "initializes Graphgan with yarns" do
      assert graph.yarns
    end
  end

  describe "#yarn_color" do
    file = FileReader.new("canvas_test.txt")
    canvas = file.create_canvas
    yarns = file.list_yarns
    graph = Graphgan.new(canvas, yarns)

    it "returns a string" do
      assert graph.yarn_color("1").is_a? String
    end

    it "returns color corresponding to parameter value" do
      assert_equal "orange", graph.yarn_color("1")
    end
  end

  describe "#display_frequency_table" do
    file = FileReader.new("canvas_test.txt")
    canvas = file.create_canvas
    yarns = file.list_yarns
    graph = Graphgan.new(canvas, yarns)

    it "returns a hash" do
      assert graph.display_frequency_table.is_a? Hash
    end

    it "returns hash with color key and percentage value" do
      expected = {"orange"=>33.33, "coral"=>33.33, "tomato"=>33.33}
      assert_equal expected, graph.display_frequency_table
    end
  end
end
