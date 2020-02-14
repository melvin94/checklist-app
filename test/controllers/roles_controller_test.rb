require 'test_helper'

class RolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @role = roles(:one)
  end

  test "should get index" do
    get roles_url
    assert_response :success
  end

  test "should get new" do
    get new_role_url
    assert_response :success
  end

  test "should create role" do
    assert_difference('Role.count') do
      post roles_url, params: { role: { admin: @role.admin, audit_manager: @role.audit_manager, audit_user: @role.audit_user, checklist_manager: @role.checklist_manager, checklist_user: @role.checklist_user, organization_manager: @role.organization_manager, primary: @role.primary, title: @role.title, user_manager: @role.user_manager } }
    end

    assert_redirected_to role_url(Role.last)
  end

  test "should show role" do
    get role_url(@role)
    assert_response :success
  end

  test "should get edit" do
    get edit_role_url(@role)
    assert_response :success
  end

  test "should update role" do
    patch role_url(@role), params: { role: { admin: @role.admin, audit_manager: @role.audit_manager, audit_user: @role.audit_user, checklist_manager: @role.checklist_manager, checklist_user: @role.checklist_user, organization_manager: @role.organization_manager, primary: @role.primary, title: @role.title, user_manager: @role.user_manager } }
    assert_redirected_to role_url(@role)
  end

  test "should destroy role" do
    assert_difference('Role.count', -1) do
      delete role_url(@role)
    end

    assert_redirected_to roles_url
  end
end
