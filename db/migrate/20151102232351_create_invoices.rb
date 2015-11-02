class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.references :customer_id, index: true, foreign_key: true
      t.string :status

      t.timestamps null: false
    end
  end
end
