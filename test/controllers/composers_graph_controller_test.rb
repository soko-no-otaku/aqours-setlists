require 'test_helper'

class ComposersGraphControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get composers_graph_index_url
    assert_response :success
  end

end
