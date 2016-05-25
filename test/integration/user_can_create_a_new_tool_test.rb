require 'test_helper'

class UserCanCreateANewToolTest < ActionDispatch::IntegrationTest
  test "user can create a tool" do
    visit "/tools/new"

    fill_in "Name", with: "Screwdriver"
    fill_in "Price", with: "10.99"
    fill_in "Quantity", with: "10"
    click_button "Create Tool"

    assert_equal tool_path(Tool.last.id), current_path

    within(".tool_info") do
      assert page.has_content?("Name: Screwdriver")
      assert page.has_content?("Price: 10.99")
      assert page.has_content?("Quantity: 10")
    end
  end
end
