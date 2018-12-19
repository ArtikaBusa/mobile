require 'test_helper'

class DisplaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @display = displays(:one)
  end

  test "should get index" do
    get displays_url
    assert_response :success
  end

  test "should get new" do
    get new_display_url
    assert_response :success
  end

  test "should create display" do
    assert_difference('Display.count') do
      post displays_url, params: { display: { name: @display.name } }
    end

    assert_redirected_to display_url(Display.last)
  end

  test "should show display" do
    get display_url(@display)
    assert_response :success
  end

  test "should get edit" do
    get edit_display_url(@display)
    assert_response :success
  end

  test "should update display" do
    patch display_url(@display), params: { display: { name: @display.name } }
    assert_redirected_to display_url(@display)
  end

  test "should destroy display" do
    assert_difference('Display.count', -1) do
      delete display_url(@display)
    end

    assert_redirected_to displays_url
  end
end
