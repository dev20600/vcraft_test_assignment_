require 'test_helper'

class TodoProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @todo_project = todo_projects(:one)
  end

  test "should get index" do
    get todo_projects_url
    assert_response :success
  end

  test "should get new" do
    get new_todo_project_url
    assert_response :success
  end

  test "should create todo_project" do
    assert_difference('TodoProject.count') do
      post todo_projects_url, params: { todo_project: { description: @todo_project.description, title: @todo_project.title } }
    end

    assert_redirected_to todo_project_url(TodoProject.last)
  end

  test "should show todo_project" do
    get todo_project_url(@todo_project)
    assert_response :success
  end

  test "should get edit" do
    get edit_todo_project_url(@todo_project)
    assert_response :success
  end

  test "should update todo_project" do
    patch todo_project_url(@todo_project), params: { todo_project: { description: @todo_project.description, title: @todo_project.title } }
    assert_redirected_to todo_project_url(@todo_project)
  end

  test "should destroy todo_project" do
    assert_difference('TodoProject.count', -1) do
      delete todo_project_url(@todo_project)
    end

    assert_redirected_to todo_projects_url
  end
end
