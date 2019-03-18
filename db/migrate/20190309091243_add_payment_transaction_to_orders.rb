class AddPaymentTransactionToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :payment_transaction, :string
  end
end
