require 'test_helper'

class CooccurrenceGraphControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cooccurrence_graph_url
    assert_response :success
  end

end
