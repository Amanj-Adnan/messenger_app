require "test_helper"

class RomesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @room = romes(:one)
  end

  test "should get index" do
    get rooms_url
    assert_response :success
  end

  test "should get new" do
    get new_room_url
    assert_response :success
  end

  test "should create rome" do
    assert_difference('Rome.count') do
      post rooms_url, params: { room: { name: @room.name } }
    end

    assert_redirected_to room_url(Room.last)
  end

  test "should show rome" do
    get room_url(@room)
    assert_response :success
  end

  test "should get edit" do
    get edit_room_url(@room)
    assert_response :success
  end

  test "should update rome" do
    patch room_url(@room), params: { room: { name: @room.name } }
    assert_redirected_to room_url(@room)
  end

  test "should destroy rome" do
    assert_difference('Rome.count', -1) do
      delete room_url(@room)
    end

    assert_redirected_to rooms_url
  end
end
