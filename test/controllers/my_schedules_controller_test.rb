require "test_helper"

class MySchedulesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_schedules_index_url
    assert_response :success
  end

  test "should get new" do
    get my_schedules_new_url
    assert_response :success
  end

  test "should get show" do
    get my_schedules_show_url
    assert_response :success
  end

  test "should get edit" do
    get my_schedules_edit_url
    assert_response :success
  end
end
