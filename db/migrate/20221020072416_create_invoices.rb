class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.string :inv_number
      t.references :client, null: false, foreign_key: true
      t.datetime :date_of_issue
      t.datetime :due_date
      t.string :job_reference
      t.string :description
      t.integer :quantity
      t.integer :unit_price
      t.integer :tax
      t.integer :amount
      t.integer :total_amount
      t.integer :paid
      t.integer :due_amount

      t.timestamps
    end
  end
end
