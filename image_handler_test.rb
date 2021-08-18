require "minitest/autorun"
require "./image_handler"

class ImageHandlerTest < Minitest::Test
  describe "initialization" do
    picture = ImageHandler.new("winnie.jpeg", "winnie.gif")

    it "creates a new instance of ImageHandler" do
      assert picture.is_a? ImageHandler
    end
  end

  describe "#process" do
    picture = ImageHandler.new("winnie.jpeg", "winnie.gif")

    it "returns true if command is executed" do
      assert picture.process
    end
  end
end
