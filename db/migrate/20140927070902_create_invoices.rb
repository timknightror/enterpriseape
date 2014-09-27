class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :company
      t.datetime :date
      t.decimal :tax
      t.string :salesperson

      t.timestamps
    end
  end
end
