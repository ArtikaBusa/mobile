class AddConfirmableToDeviseSeller < ActiveRecord::Migration[5.2]
  def self.up
    add_column :sellers, :confirmation_token,   :string
    add_column :sellers, :confirmed_at,         :datetime
    add_column :sellers, :confirmation_sent_at, :datetime
    add_column :sellers, :unconfirmed_email,    :string

    add_index  :sellers, :confirmation_token, unique: true
  end

  def self.down
    remove_index  :sellers, :confirmation_token

    remove_column :sellers, :unconfirmed_email
    remove_column :sellers, :confirmation_sent_at
    remove_column :sellers, :confirmed_at
    remove_column :sellers, :confirmation_token
  end
end
