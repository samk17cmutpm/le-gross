require 'test_helper'

class PacksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get packs_index_url
    assert_response :success
  end

  test "should get new" do
    get packs_new_url
    assert_response :success
  end

  test "should get update" do
    get packs_update_url
    assert_response :success
  end

end
