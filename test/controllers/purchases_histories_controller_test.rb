require 'test_helper'

class PurchasesHistoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get purchases_histories_index_url
    assert_response :success
  end

  test "should get show" do
    get purchases_histories_show_url
    assert_response :success
  end

  test "should get edit" do
    get purchases_histories_edit_url
    assert_response :success
  end

  test "should get new" do
    get purchases_histories_new_url
    assert_response :success
  end

end
