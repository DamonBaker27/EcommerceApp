require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get Name:string" do
    get products_Name:string_url
    assert_response :success
  end

  test "should get Description:string" do
    get products_Description:string_url
    assert_response :success
  end

  test "should get Price:float" do
    get products_Price:float_url
    assert_response :success
  end

  test "should get Stock:integer" do
    get products_Stock:integer_url
    assert_response :success
  end
end
