require './app'
require 'capybara'
require 'capybara/dsl'
require 'minitest/autorun'

class AppTest < Minitest::Test
  include Capybara::DSL

  def setup
    Capybara.app = Sinatra::Application.new
  end

  def test_home_page
    visit '/'

    assert page.has_content?('Welcome to graphgan!')
  end

  def test_graph_page
    visit '/graph'

    assert page.has_content?('Graph')
    assert page.has_content?('Frequency')
    assert page.has_css?('table', :count => 2)
  end
end
