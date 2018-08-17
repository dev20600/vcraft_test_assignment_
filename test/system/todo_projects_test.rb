require "application_system_test_case"

class TodoProjectsTest < ApplicationSystemTestCase
  setup do
    @todo_project = todo_projects(:one)
  end

  test "visiting the index" do
    visit todo_projects_url
    assert_selector "h1", text: "Todo Projects"
  end

  test "creating a Todo project" do
    visit todo_projects_url
    click_on "New Todo Project"

    fill_in "Description", with: @todo_project.description
    fill_in "Title", with: @todo_project.title
    click_on "Create Todo project"

    assert_text "Todo project was successfully created"
    click_on "Back"
  end

  test "updating a Todo project" do
    visit todo_projects_url
    click_on "Edit", match: :first

    fill_in "Description", with: @todo_project.description
    fill_in "Title", with: @todo_project.title
    click_on "Update Todo project"

    assert_text "Todo project was successfully updated"
    click_on "Back"
  end

  test "destroying a Todo project" do
    visit todo_projects_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Todo project was successfully destroyed"
  end
end
