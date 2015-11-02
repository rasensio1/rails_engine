class RemoveIDsfromIItem < ActiveRecord::Migration
  def change
    remove_column :invoice_items, :item_id
    remove_column :invoice_items, :invoice_id
    remove_column :invoices, :customer_id
  end
end
