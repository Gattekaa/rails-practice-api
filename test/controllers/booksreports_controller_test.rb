require "test_helper"

class BooksreportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booksreport = booksreports(:one)
  end

  test "should get index" do
    get booksreports_url, as: :json
    assert_response :success
  end

  test "should create booksreport" do
    assert_difference("Booksreport.count") do
      post booksreports_url, params: { booksreport: { data: @booksreport.data, user_id: @booksreport.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show booksreport" do
    get booksreport_url(@booksreport), as: :json
    assert_response :success
  end

  test "should update booksreport" do
    patch booksreport_url(@booksreport), params: { booksreport: { data: @booksreport.data, user_id: @booksreport.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy booksreport" do
    assert_difference("Booksreport.count", -1) do
      delete booksreport_url(@booksreport), as: :json
    end

    assert_response :no_content
  end
end
