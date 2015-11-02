class AddForeignKeys < ActiveRecord::Migration
  def change
    add_column :invoice_items, :item_id, :integer
    add_column :invoice_items, :invoice_id, :integer
    add_column :invoices, :customer_id, :integer
    add_column :invoices, :merchant_id, :integer
  end
end
