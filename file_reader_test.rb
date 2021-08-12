require "minitest/autorun"
require "./file_reader"

class FileReaderTest < Minitest::Test
  describe "initialization" do
    file = FileReader.new("canvas_test.txt")

    it "creates a new instance of FileReader" do
      assert file.is_a? FileReader
    end

    it "reads in file name parameter" do
      assert_equal "canvas_test.txt", file.file_name
    end
  end

  describe "#graphgan" do
    graph = FileReader.new("canvas_test.txt").graphgan

    it "creates a new instance of Graphgan" do
      assert graph.is_a? Graphgan
    end
  end

  describe "#source_file" do
    file = FileReader.new("canvas_test.txt")

    it "reads entire contents of file" do
      assert_equal ["1 2 3", "3 2 1", "eoc",
                    "1:orange", "2:coral", "3:tomato"],file.source_file
    end
  end

  describe "#eoc" do
    file = FileReader.new("canvas_test.txt")

    it "returns an integer" do
      assert file.eoc.is_a? Integer
    end

    it "returns index where END_OF_CANVAS const occurs in file" do
      assert_equal 2, file.eoc
    end
  end

  describe "#create_canvas" do
    file = FileReader.new("canvas_test.txt")

    it "returns an array" do
      assert file.create_canvas.is_a? Array
    end

    it "returns multidimensional array with values on canvas" do
      assert_equal [["1", "2", "3"],
                    ["3", "2", "1"]], file.create_canvas
    end
  end

  describe "list_yarns" do
    file = FileReader.new("canvas_test.txt")

    it "returns a hash" do
      assert file.list_yarns.is_a? Hash
    end

    it "returns hash with number keys and color values " do
      expected = {"1"=>"orange","2"=>"coral","3"=>"tomato"}
      assert_equal expected, file.list_yarns
    end
  end
end
