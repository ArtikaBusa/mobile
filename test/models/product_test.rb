require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test 'should report error' do
    # some_undefined_variable is not defined elsewhere in the test case
    assert_raises(NameError) do
      some_undefined_variable
    end
  end
end
