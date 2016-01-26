require 'test_helper'

class RepairOrderRecordsControllerTest < ActionController::TestCase
  setup do
    @repair_order_record = repair_order_records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:repair_order_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create repair_order_record" do
    assert_difference('RepairOrderRecord.count') do
      post :create, repair_order_record: { maintenance: @repair_order_record.maintenance, recommendations: @repair_order_record.recommendations, repair_order: @repair_order_record.repair_order }
    end

    assert_redirected_to repair_order_record_path(assigns(:repair_order_record))
  end

  test "should show repair_order_record" do
    get :show, id: @repair_order_record
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @repair_order_record
    assert_response :success
  end

  test "should update repair_order_record" do
    patch :update, id: @repair_order_record, repair_order_record: { maintenance: @repair_order_record.maintenance, recommendations: @repair_order_record.recommendations, repair_order: @repair_order_record.repair_order }
    assert_redirected_to repair_order_record_path(assigns(:repair_order_record))
  end

  test "should destroy repair_order_record" do
    assert_difference('RepairOrderRecord.count', -1) do
      delete :destroy, id: @repair_order_record
    end

    assert_redirected_to repair_order_records_path
  end
end
