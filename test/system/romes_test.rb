require "application_system_test_case"

class RomesTest < ApplicationSystemTestCase
  setup do
    @room = romes(:one)
  end

  test "visiting the index" do
    visit rooms_url
    assert_selector "h1", text: "Romes"
  end

  test "creating a Rome" do
    visit rooms_url
    click_on "New Rome"

    fill_in "Name", with: @room.name
    click_on "Create Rome"

    assert_text "Rome was successfully created"
    click_on "Back"
  end

  test "updating a Rome" do
    visit rooms_url
    click_on "Edit", match: :first

    fill_in "Name", with: @room.name
    click_on "Update Rome"

    assert_text "Rome was successfully updated"
    click_on "Back"
  end

  test "destroying a Rome" do
    visit rooms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rome was successfully destroyed"
  end
end
