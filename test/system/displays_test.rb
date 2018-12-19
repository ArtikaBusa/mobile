require "application_system_test_case"

class DisplaysTest < ApplicationSystemTestCase
  setup do
    @display = displays(:one)
  end

  test "visiting the index" do
    visit displays_url
    assert_selector "h1", text: "Displays"
  end

  test "creating a Display" do
    visit displays_url
    click_on "New Display"

    fill_in "Name", with: @display.name
    click_on "Create Display"

    assert_text "Display was successfully created"
    click_on "Back"
  end

  test "updating a Display" do
    visit displays_url
    click_on "Edit", match: :first

    fill_in "Name", with: @display.name
    click_on "Update Display"

    assert_text "Display was successfully updated"
    click_on "Back"
  end

  test "destroying a Display" do
    visit displays_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Display was successfully destroyed"
  end
end
