require "minitest/autorun"
require "./image_handler"

class ImageHandlerTest < Minitest::Test
  describe "initialization" do
    picture = ImageHandler.new("winnie.jpeg")

    it "creates a new instance of ImageHandler" do
      assert picture.is_a? ImageHandler
    end

    it "reads in path parameter" do
      assert_equal "winnie.jpeg", picture.path
    end
  end
end
