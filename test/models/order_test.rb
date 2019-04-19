require 'test_helper'
class OrderTest < ActiveSupport::TestCase
  test 'should not save order without user' do
    order = Order.new
    assert_not order.save
  end
end
